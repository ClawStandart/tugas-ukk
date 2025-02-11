<?php
session_start();
require 'config.php';

// Only allow admin and staff to access this page
if (!isset($_SESSION['user_id']) || !in_array($_SESSION['role'], ['admin', 'staff'])) {
    header("Location: login.php");
    exit;
}

$message = "";
if (isset($_GET['message'])) {
    $message = $_GET['message'];
}

// Process deletion if a delete request is sent via GET
if (isset($_GET['delete_book_id'])) {
    $book_id_to_delete = $_GET['delete_book_id'];
    $stmt = $conn->prepare("DELETE FROM Books WHERE book_id = :book_id");
    $stmt->bindParam(':book_id', $book_id_to_delete);
    if($stmt->execute()){
       $message = "Book deleted successfully.";
    } else {
       $message = "Failed to delete book.";
    }
    header("Location: inventory.php?message=" . urlencode($message));
    exit;
}

// Process addition of a new book via POST
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['add_book'])) {
    $title = trim($_POST['title']);
    $author = trim($_POST['author']);
    $genre = trim($_POST['genre']);
    $published_date = $_POST['published_date'];
    $is_recommended = isset($_POST['is_recommended']) ? 1 : 0;
    $cover_image = trim($_POST['cover_image']);
    $description = trim($_POST['description']);
    $content = trim($_POST['content']);
    
    $stmt = $conn->prepare("INSERT INTO Books (title, author, genre, published_date, is_recommended, cover_image, created_at, description, content) 
                            VALUES (:title, :author, :genre, :published_date, :is_recommended, :cover_image, NOW(), :description, :content)");
    $stmt->bindParam(':title', $title);
    $stmt->bindParam(':author', $author);
    $stmt->bindParam(':genre', $genre);
    $stmt->bindParam(':published_date', $published_date);
    $stmt->bindParam(':is_recommended', $is_recommended);
    $stmt->bindParam(':cover_image', $cover_image);
    $stmt->bindParam(':description', $description);
    $stmt->bindParam(':content', $content);
    
    if($stmt->execute()){
        $message = "Book added successfully.";
    } else {
        $message = "Failed to add book.";
    }
    header("Location: inventory.php?message=" . urlencode($message));
    exit;
}

// Fetch all books from the inventory
$stmt = $conn->prepare("SELECT * FROM Books ORDER BY title ASC");
$stmt->execute();
$books = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Inventory Management - Digital Library</title>
  <link rel="stylesheet" href="asset/style.css">
</head>
<body>
  <?php include 'asset/navbar.php'; ?>
  <div class="main-container">
    <div class="content">
      <h1>Inventory Management</h1>
      <?php if ($message): ?>
          <p class="message"><?php echo htmlspecialchars($message); ?></p>
      <?php endif; ?>

      <!-- Form to add a new book -->
      <h2>Add New Book</h2>
      <form action="inventory.php" method="POST">
          <input type="hidden" name="add_book" value="1">
          <div class="form-group">
              <label for="title">Title:</label>
              <input type="text" name="title" id="title" required>
          </div>
          <div class="form-group">
              <label for="author">Author:</label>
              <input type="text" name="author" id="author" required>
          </div>
          <div class="form-group">
              <label for="genre">Genre:</label>
              <input type="text" name="genre" id="genre" required>
          </div>
          <div class="form-group">
              <label for="published_date">Published Date:</label>
              <input type="date" name="published_date" id="published_date" required>
          </div>
          <div class="form-group">
              <label for="is_recommended">Recommended:</label>
              <input type="checkbox" name="is_recommended" id="is_recommended">
          </div>
          <div class="form-group">
              <label for="cover_image">Cover Image URL:</label>
              <input type="text" name="cover_image" id="cover_image" required>
          </div>
          <div class="form-group">
              <label for="description">Description:</label>
              <textarea name="description" id="description" rows="3" required></textarea>
          </div>
          <div class="form-group">
              <label for="content">Content:</label>
              <textarea name="content" id="content" rows="5" required></textarea>
          </div>
          <button type="submit" class="btn">Add Book</button>
      </form>

      <!-- Inventory Table -->
      <h2>Current Inventory</h2>
      <table border="1" width="100%" cellpadding="10">
          <tr>
              <th>Book ID</th>
              <th>Title</th>
              <th>Author</th>
              <th>Genre</th>
              <th>Published Date</th>
              <th>Actions</th>
          </tr>
          <?php foreach ($books as $book): ?>
          <tr>
              <td><?php echo $book['book_id']; ?></td>
              <td><?php echo htmlspecialchars($book['title']); ?></td>
              <td><?php echo htmlspecialchars($book['author']); ?></td>
              <td><?php echo htmlspecialchars($book['genre']); ?></td>
              <td><?php echo htmlspecialchars($book['published_date']); ?></td>
              <td>
                  <a href="edit_book.php?book_id=<?php echo $book['book_id']; ?>">Edit</a> | 
                  <a href="inventory.php?delete_book_id=<?php echo $book['book_id']; ?>" onclick="return confirm('Are you sure you want to delete this book?')">Delete</a>
              </td>
          </tr>
          <?php endforeach; ?>
      </table>
    </div>
  </div>
</body>
</html>
