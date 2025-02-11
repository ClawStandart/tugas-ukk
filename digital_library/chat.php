<?php
require 'config.php';

// Check if user is logged in and is part of a group (admin/staff)
if (!isset($_SESSION['user_id']) || ($_SESSION['role'] !== 'staff' && $_SESSION['role'] !== 'admin')) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];
$group_id = isset($_GET['group_id']) ? $_GET['group_id'] : 1; // Default group (can be dynamically passed)

// Fetch group members
$stmt = $conn->prepare("SELECT user_id FROM GroupMembers WHERE group_id = :group_id");
$stmt->bindParam(':group_id', $group_id);
$stmt->execute();
$group_members = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch group chat messages
$stmt = $conn->prepare("SELECT * FROM Messages WHERE group_id = :group_id ORDER BY created_at ASC");
$stmt->bindParam(':group_id', $group_id);
$stmt->execute();
$messages = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $message = $_POST['message'];
    if (!empty($message)) {
        // Insert new message into the group (group_id is passed in the URL or defaults to 1)
        $stmt = $conn->prepare("INSERT INTO Messages (sender_id, receiver_id, message, group_id) VALUES (:sender_id, NULL, :message, :group_id)");
        $stmt->bindParam(':sender_id', $user_id);
        $stmt->bindParam(':message', $message);
        $stmt->bindParam(':group_id', $group_id);
        $stmt->execute();
        header("Location: chat.php?group_id=" . $group_id); // Refresh to show new message
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Group Chat</title>
    <link rel="stylesheet" href="asset/style.css">
    <style>
        /* Chat popup styles */
        .chat-popup {
            position: fixed;
            bottom: 0;
            right: 0;
            width: 300px;
            background: #fff;
            border: 1px solid #ccc;
            padding: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: none;
        }
        .chat-popup.active {
            display: block;
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

    <button id="chatToggleBtn" onclick="toggleChat()">Open Chat</button>

    <div id="chatPopup" class="chat-popup">
        <div class="chat-popup-header">
            Group Chat: Admin/Staff
        </div>
        <div class="chat-messages">
            <?php foreach ($messages as $msg): ?>
                <p><strong><?php echo $msg['sender_id'] == $user_id ? 'You' : 'Other User'; ?>:</strong> <?php echo htmlspecialchars($msg['message']); ?></p>
            <?php endforeach; ?>
        </div>

        <form action="chat.php?group_id=<?php echo $group_id; ?>" method="POST">
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
