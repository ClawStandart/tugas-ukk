<?php
session_start();
require 'config.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Fetch user's history
$stmt = $conn->prepare("SELECT Books.* FROM History INNER JOIN Books ON History.book_id = Books.book_id WHERE History.user_id = :user_id");
$stmt->bindParam(':user_id', $user_id);
$stmt->execute();
$history = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Delete book from history
if (isset($_GET['delete_book_id'])) {
    $book_id_to_delete = $_GET['delete_book_id'];
    $stmt = $conn->prepare("DELETE FROM History WHERE user_id = :user_id AND book_id = :book_id");
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':book_id', $book_id_to_delete);
    $stmt->execute();

    // Redirect to prevent form resubmission
    header("Location: history.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Reading History</title>
    <link rel="stylesheet" href="asset/style.css">
</head>
<body>
    <?php include 'asset/navbar.php'; ?>

    <h1>Your Reading History</h1>

    <div class="history-list">
        <?php if (count($history) > 0): ?>
            <ul>
                <?php foreach ($history as $book): ?>
                    <li>
                        <div class="history-item">
                            <img src="<?php echo $book['cover_image']; ?>" alt="Cover of <?php echo htmlspecialchars($book['title']); ?>" class="history-cover">
                            <div class="history-info">
                                <h3><?php echo htmlspecialchars($book['title']); ?></h3>
                                <p><?php echo htmlspecialchars($book['author']); ?></p>
                            </div>
                            <!-- Delete Button -->
                            <a href="?delete_book_id=<?php echo $book['book_id']; ?>" class="delete-button" onclick="return confirm('Are you sure you want to delete this from your history?')">Delete</a>
                        </div>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php else: ?>
            <p>You have no reading history.</p>
        <?php endif; ?>
    </div>

</body>
</html>
