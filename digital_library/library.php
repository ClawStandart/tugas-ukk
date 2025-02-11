<?php
session_start();
require 'config.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Fetch all books, sorted alphabetically by title
$stmt = $conn->prepare("SELECT * FROM Books ORDER BY title ASC");
$stmt->execute();
$allBooks = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Group books by first letter of the title
$groupedBooks = [];
foreach ($allBooks as $book) {
    $firstLetter = strtoupper(substr($book['title'], 0, 1)); // Get first letter of the title
    if (!isset($groupedBooks[$firstLetter])) {
        $groupedBooks[$firstLetter] = [];
    }
    $groupedBooks[$firstLetter][] = $book;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library - Rizky's Library</title>
    <link rel="stylesheet" href="asset/style.css">
</head>
<body>
    <?php include 'asset/navbar.php'; ?>

    <div class="content">
        <h1>All Books in Library</h1>

        <!-- Grouped Books by Alphabet -->
        <?php foreach ($groupedBooks as $letter => $books): ?>
            <h2><?php echo $letter; ?></h2> <!-- Display the letter -->
            <ul class="book-list">
                <?php foreach ($books as $book): ?>
                    <li class="book-item">
                        <a href="book-details.php?book_id=<?php echo $book['book_id']; ?>">
                            <?php echo htmlspecialchars($book['title']); ?>
                        </a>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php endforeach; ?>
    </div>
</body>
</html>
