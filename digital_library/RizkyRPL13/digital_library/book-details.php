<?php
session_start();
require 'config.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Fetch book details
if (isset($_GET['book_id'])) {
    $book_id = $_GET['book_id'];
    $stmt = $conn->prepare("SELECT * FROM Books WHERE book_id = :book_id");
    $stmt->bindParam(':book_id', $book_id);
    $stmt->execute();
    $book = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$book) {
        die('Book not found.');
    }

    // Check if the book is already in the user's history
    $stmt = $conn->prepare("SELECT * FROM History WHERE user_id = :user_id AND book_id = :book_id");
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':book_id', $book_id);
    $stmt->execute();

    // If the book is not in the history, insert it
    if ($stmt->rowCount() == 0) {
        // Insert into the History table when the book is accessed
        $stmt = $conn->prepare("INSERT INTO History (user_id, book_id) VALUES (:user_id, :book_id)");
        $stmt->bindParam(':user_id', $user_id);
        $stmt->bindParam(':book_id', $book_id);
        $stmt->execute();
    }
}

// Check if book is favorited
function isFavorited($user_id, $book_id, $conn) {
    $stmt = $conn->prepare("SELECT * FROM Favorites WHERE user_id = :user_id AND book_id = :book_id");
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':book_id', $book_id);
    $stmt->execute();
    return $stmt->rowCount() > 0;
}

// Add or Remove Favorite
if (isset($_GET['favorite']) && isset($_GET['book_id'])) {
    $book_id = $_GET['book_id'];

    if (isFavorited($user_id, $book_id, $conn)) {
        // Remove from favorites
        $stmt = $conn->prepare("DELETE FROM Favorites WHERE user_id = :user_id AND book_id = :book_id");
    } else {
        // Add to favorites
        $stmt = $conn->prepare("INSERT INTO Favorites (user_id, book_id) VALUES (:user_id, :book_id)");
    }

    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':book_id', $book_id);
    $stmt->execute();

    // Redirect to prevent form resubmission
    header("Location: book-details.php?book_id=$book_id");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($book['title']); ?> - Book Details</title>
    <link rel="stylesheet" href="asset/style.css">
</head>
<body>
    <?php include 'asset/navbar.php'; ?>

    <div class="book-details">
        <h1><?php echo htmlspecialchars($book['title']); ?></h1>
        <img src="<?php echo $book['cover_image']; ?>" alt="Cover of <?php echo htmlspecialchars($book['title']); ?>" class="book-cover">
        <p><strong>Author:</strong> <?php echo htmlspecialchars($book['author']); ?></p>
        <p><strong>Genre:</strong> <?php echo htmlspecialchars($book['genre']); ?></p>
        <p><strong>Description:</strong> <?php echo nl2br(htmlspecialchars($book['description'])); ?></p>

        <a href="?favorite=1&book_id=<?php echo $book['book_id']; ?>" class="favorite-button">
            <?php echo isFavorited($user_id, $book['book_id'], $conn) ? '❤️' : '🤍'; ?> Favorite
        </a>

        <!-- Read Button -->
        <a href="read.php?book_id=<?php echo $book['book_id']; ?>" class="read-button">Read</a>
    </div>
</body>
</html>
