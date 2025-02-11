<?php
session_start();
require 'config.php';

// Check if user is logged in and is admin or staff
if (!isset($_SESSION['user_id']) || !in_array($_SESSION['role'], ['admin', 'staff'])) {
    header("Location: login.php");
    exit;
}

// Get book ID from URL
if (!isset($_GET['book_id'])) {
    header("Location: inventory.php"); // Redirect if no book_id is provided
    exit;
}

$book_id = $_GET['book_id'];

// Fetch book details
$stmt = $conn->prepare("SELECT * FROM Books WHERE book_id = :book_id");
$stmt->bindParam(':book_id', $book_id, PDO::PARAM_INT);
$stmt->execute();
$book = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$book) {
    echo "Book not found!";
    exit;
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'];
    $author = $_POST['author'];
    $description = $_POST['description'];

    if (empty($title) || empty($author) || empty($description)) {
        $error = "All fields are required!";
    } else {
        $stmt = $conn->prepare("UPDATE Books SET title = :title, author = :author, description = :description WHERE book_id = :book_id");
        $stmt->bindParam(':title', $title);
        $stmt->bindParam(':author', $author);
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':book_id', $book_id, PDO::PARAM_INT);
        $stmt->execute();

        // Redirect to inventory.php after update
        header("Location: inventory.php");
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Book</title>
    <link rel="stylesheet" href="asset/style.css">
</head>
<body>
    <?php include 'asset/navbar.php'; ?>

    <div class="content">
        <h1>Edit Book</h1>

        <?php if (isset($error)): ?>
            <p style="color: red;"><?php echo $error; ?></p>
        <?php endif; ?>

        <form action="edit_book.php?book_id=<?php echo $book_id; ?>" method="POST">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($book['title']); ?>" required>

            <label for="author">Author:</label>
            <input type="text" id="author" name="author" value="<?php echo htmlspecialchars($book['author']); ?>" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required><?php echo htmlspecialchars($book['description']); ?></textarea>

            <button type="submit">Update Book</button>
        </form>
    </div>

</body>
</html>
