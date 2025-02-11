<?php
session_start();
require 'config.php';

// Check if user is logged in and has the correct role (staff/admin)
if (!isset($_SESSION['user_id']) || ($_SESSION['role'] !== 'staff' && $_SESSION['role'] !== 'admin')) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Fetch chat messages between logged-in user and selected staff/admin (e.g., from query param or default chat)
$receiver_id = isset($_GET['receiver_id']) ? $_GET['receiver_id'] : $user_id; 

// Get the username of the receiver (staff/admin)
$stmt = $conn->prepare("SELECT username FROM Users WHERE user_id = :receiver_id");
$stmt->bindParam(':receiver_id', $receiver_id);
$stmt->execute();
$receiver = $stmt->fetch(PDO::FETCH_ASSOC);
$receiver_name = $receiver ? $receiver['username'] : 'Unknown';

// Fetch chat messages
$stmt = $conn->prepare("SELECT * FROM Messages WHERE (sender_id = :user_id AND receiver_id = :receiver_id) OR (sender_id = :receiver_id AND receiver_id = :user_id) ORDER BY created_at ASC");
$stmt->bindParam(':user_id', $user_id);
$stmt->bindParam(':receiver_id', $receiver_id);
$stmt->execute();
$messages = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $message = $_POST['message'];
    if (!empty($message)) {
        // Insert new message
        $stmt = $conn->prepare("INSERT INTO Messages (sender_id, receiver_id, message) VALUES (:sender_id, :receiver_id, :message)");
        $stmt->bindParam(':sender_id', $user_id);
        $stmt->bindParam(':receiver_id', $receiver_id);
        $stmt->bindParam(':message', $message);
        $stmt->execute();
        header("Location: chat.php?receiver_id=" . $receiver_id); // Refresh to show new message
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
    <link rel="stylesheet" href="asset/style.css">
    <style>
        .chat-popup {
            position: fixed;
            bottom: 0;
            right: 0;
            width: 300px;
            background: #fff;
            border: 1px solid #ccc;
            padding: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: none; /* Hidden by default */
        }
        .chat-popup.active {
            display: block; /* Show when active */
        }
        .chat-popup-header {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .chat-messages {
            height: 200px;
            overflow-y: auto;
            margin-bottom: 10px;
        }
        .chat-messages p {
            margin: 5px 0;
        }
        .chat-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
        }
        .chat-button {
            padding: 5px 10px;
            margin-top: 5px;
            background-color: #4CAF50;
            color: white;
            border: none;
        }
    </style>
</head>
<body>
    <?php include 'asset/navbar.php'; ?>

    <!-- Button to toggle chat window -->
    <button id="chatToggleBtn" onclick="toggleChat()">Open Chat</button>

    <!-- Chat Popup -->
    <div id="chatPopup" class="chat-popup">
        <div class="chat-popup-header">
            Chat with <?php echo htmlspecialchars($receiver_name); ?>
        </div>
        <div class="chat-messages">
            <?php foreach ($messages as $msg): ?>
                <p><strong><?php echo $msg['sender_id'] == $user_id ? 'You' : htmlspecialchars($receiver_name); ?>:</strong> <?php echo htmlspecialchars($msg['message']); ?></p>
            <?php endforeach; ?>
        </div>

        <!-- Form to send new message -->
        <form action="chat.php?receiver_id=<?php echo $receiver_id; ?>" method="POST">
            <textarea name="message" class="chat-input" placeholder="Type a message..." required></textarea>
            <button type="submit" class="chat-button">Send</button>
        </form>
    </div>

    <script>
        function toggleChat() {
            var chatPopup = document.getElementById('chatPopup');
            chatPopup.classList.toggle('active');
        }
    </script>
</body>
</html>
