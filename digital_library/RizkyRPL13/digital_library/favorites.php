<?php
session_start();
require 'config.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Fetch favorited books
$stmt = $conn->prepare("
    SELECT Books.book_id, Books.title, Books.author, Books.cover_image, Books.description 
    FROM Favorites 
    INNER JOIN Books ON Favorites.book_id = Books.book_id 
    WHERE Favorites.user_id = :user_id
");
$stmt->bindParam(':user_id', $user_id);
$stmt->execute();
$favoritedBooks = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Favorite Books</title>
    <link rel="stylesheet" href="asset/style.css">
</head>
<body>
    <?php include 'asset/navbar.php'; ?>

    <div class="content">
        <h1>Your Favorite Books</h1>

        <!-- Favorite Books Grid -->
        <?php if (count($favoritedBooks) > 0): ?>
            <div class="book-grid">
                <?php foreach ($favoritedBooks as $book): ?>
                    <div class="book-item">
                        <a href="book-details.php?book_id=<?php echo $book['book_id']; ?>">
                            <img src="<?php echo $book['cover_image']; ?>" alt="Cover of <?php echo htmlspecialchars($book['title']); ?>">
                            <h3><?php echo htmlspecialchars($book['title']); ?></h3>
                        </a>
                        <p>by <?php echo htmlspecialchars($book['author']); ?></p>
                        <p><?php echo nl2br(htmlspecialchars($book['description'])); ?></p>
                        <a href="?favorite=1&book_id=<?php echo $book['book_id']; ?>" class="favorite-button">❤️</a>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php else: ?>
            <p>You have not favorited any books yet.</p>
        <?php endif; ?>
    </div>
</body>
</html>
