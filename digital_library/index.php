<?php
session_start();
require 'config.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];
$role = $_SESSION['role']; // Expecting values: 'admin', 'staff', or 'user'

// Fetch user settings to check whether descriptions should be shown
$stmt = $conn->prepare("SELECT show_description FROM Users WHERE user_id = :user_id");
$stmt->bindParam(':user_id', $user_id);
$stmt->execute();
$userSettings = $stmt->fetch(PDO::FETCH_ASSOC);

// Handle search query and genre selection
$searchQuery = '';
$selectedGenre = '';

if (isset($_GET['search'])) {
    $searchQuery = $_GET['search'];
    $selectedGenre = $_GET['genre'];
}

// Prepare SQL query for search with optional genre filtering
$sql = "SELECT * FROM Books WHERE title LIKE :searchQuery OR author LIKE :searchQuery";
if (!empty($selectedGenre)) {
    $sql .= " AND genre = :genre";
}

$stmt = $conn->prepare($sql);
$stmt->bindValue(':searchQuery', "%$searchQuery%");
if (!empty($selectedGenre)) {
    $stmt->bindParam(':genre', $selectedGenre);
}
$stmt->execute();
$searchResults = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch Genre List for Genre Dropdown
$genres = $conn->query("SELECT DISTINCT genre FROM Books")->fetchAll(PDO::FETCH_ASSOC);

// Fetch Recommendations (Example: Same genre)
$recommendationGenre = 'Fiction'; // Replace with a dynamic user preference if available
$recommendations = $conn->prepare("SELECT * FROM Books WHERE genre = :genre LIMIT 5");
$recommendations->bindParam(':genre', $recommendationGenre);
$recommendations->execute();
$recommendationBooks = $recommendations->fetchAll(PDO::FETCH_ASSOC);

// Fetch Random Books
$randomBooks = $conn->query("SELECT * FROM Books ORDER BY RAND() LIMIT 5")->fetchAll(PDO::FETCH_ASSOC);

// Fetch Latest Books
$latestBooks = $conn->query("SELECT * FROM Books ORDER BY created_at DESC LIMIT 5")->fetchAll(PDO::FETCH_ASSOC);

// Check if book is favorited (function remains unchanged)
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
        $stmt = $conn->prepare("DELETE FROM Favorites WHERE user_id = :user_id AND book_id = :book_id");
    } else {
        $stmt = $conn->prepare("INSERT INTO Favorites (user_id, book_id) VALUES (:user_id, :book_id)");
    }
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':book_id', $book_id);
    $stmt->execute();

    // Redirect to prevent form resubmission
    header("Location: index.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Rizky's Library</title>
    <link rel="stylesheet" href="asset/style.css">
</head>
<body>
    <?php include 'asset/navbar.php'; ?>

    <div class="content">
        <h1>Welcome, <?php echo htmlspecialchars($_SESSION['username']); ?>!</h1>
        <p>Your Role: <strong><?php echo htmlspecialchars($role); ?></strong></p>

        <!-- Role-Based Options for Admin and Staff -->
        <?php if ($role === 'admin' || $role === 'staff'): ?>
            <section>
                <h2>Administrative Options</h2>
                <ul>
                    <?php if ($role === 'admin'): ?>
                        <li><a href="admin_register.php">Register New User/Staff</a></li>
                    <?php endif; ?>
                    <li><a href="inventory.php">Manage Inventory</a></li>
                    <li><a href="report.php">Generate Report</a></li>
                </ul>
            </section>
        <?php endif; ?>

        <!-- Search Bar with Genre Selection -->
        <section>
            <h2>Search for Books</h2>
            <form action="index.php" method="GET">
                <input type="text" name="search" placeholder="Search by title or author" value="<?php echo htmlspecialchars($searchQuery); ?>" id="searchInput">
                <select name="genre" style="display: none;" id="genreDropdown">
                    <option value="">Select Genre</option>
                    <?php foreach ($genres as $genre): ?>
                        <option value="<?php echo $genre['genre']; ?>" <?php echo ($genre['genre'] == $selectedGenre) ? 'selected' : ''; ?>>
                            <?php echo $genre['genre']; ?>
                        </option>
                    <?php endforeach; ?>
                </select>
                <button type="submit">Search</button>
            </form>
        </section>

        <!-- If a search query is entered, display search results; otherwise, show default sections -->
        <?php if (!empty($searchQuery)): ?>
            <section>
                <h2>Search Results</h2>
                <div class="book-grid">
                    <?php if (count($searchResults) > 0): ?>
                        <?php foreach ($searchResults as $book): ?>
                            <div class="book-item" data-book-id="<?php echo $book['book_id']; ?>">
                                <a href="book-details.php?book_id=<?php echo $book['book_id']; ?>">
                                    <img src="<?php echo $book['cover_image']; ?>" alt="Cover of <?php echo htmlspecialchars($book['title']); ?>">
                                    <h3 class="title"><?php echo htmlspecialchars($book['title']); ?></h3>
                                </a>
                                <p>by <?php echo htmlspecialchars($book['author']); ?></p>
                                <?php if ($userSettings['show_description']): ?>
                                    <p><?php echo nl2br(htmlspecialchars($book['description'])); ?></p>
                                <?php endif; ?>
                                <a href="?favorite=1&book_id=<?php echo $book['book_id']; ?>" class="favorite-button">
                                    <?php echo isFavorited($user_id, $book['book_id'], $conn) ? '❤️' : '🤍'; ?>
                                </a>
                            </div>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <p>No books found matching your search criteria.</p>
                    <?php endif; ?>
                </div>
            </section>
        <?php else: ?>
            <!-- Default Sections -->
            <section>
                <h2>Recommended for You</h2>
                <div class="book-grid">
                    <?php foreach ($recommendationBooks as $book): ?>
                        <div class="book-item" data-book-id="<?php echo $book['book_id']; ?>">
                            <a href="book-details.php?book_id=<?php echo $book['book_id']; ?>">
                                <img src="<?php echo $book['cover_image']; ?>" alt="Cover of <?php echo htmlspecialchars($book['title']); ?>">
                                <h3 class="title"><?php echo htmlspecialchars($book['title']); ?></h3>
                            </a>
                            <p>by <?php echo htmlspecialchars($book['author']); ?></p>
                            <?php if ($userSettings['show_description']): ?>
                                <p><?php echo nl2br(htmlspecialchars($book['description'])); ?></p>
                            <?php endif; ?>
                            <a href="?favorite=1&book_id=<?php echo $book['book_id']; ?>" class="favorite-button">
                                <?php echo isFavorited($user_id, $book['book_id'], $conn) ? '❤️' : '🤍'; ?>
                            </a>
                        </div>
                    <?php endforeach; ?>
                </div>
            </section>

            <section>
                <h2>Random Picks</h2>
                <div class="book-grid">
                    <?php foreach ($randomBooks as $book): ?>
                        <div class="book-item" data-book-id="<?php echo $book['book_id']; ?>">
                            <a href="book-details.php?book_id=<?php echo $book['book_id']; ?>">
                                <img src="<?php echo $book['cover_image']; ?>" alt="Cover of <?php echo htmlspecialchars($book['title']); ?>">
                                <h3 class="title"><?php echo htmlspecialchars($book['title']); ?></h3>
                            </a>
                            <p>by <?php echo htmlspecialchars($book['author']); ?></p>
                            <?php if ($userSettings['show_description']): ?>
                                <p><?php echo nl2br(htmlspecialchars($book['description'])); ?></p>
                            <?php endif; ?>
                            <a href="?favorite=1&book_id=<?php echo $book['book_id']; ?>" class="favorite-button">
                                <?php echo isFavorited($user_id, $book['book_id'], $conn) ? '❤️' : '🤍'; ?>
                            </a>
                        </div>
                    <?php endforeach; ?>
                </div>
            </section>

            <section>
                <h2>Latest Additions</h2>
                <div class="book-grid">
                    <?php foreach ($latestBooks as $book): ?>
                        <div class="book-item" data-book-id="<?php echo $book['book_id']; ?>">
                            <a href="book-details.php?book_id=<?php echo $book['book_id']; ?>">
                                <img src="<?php echo $book['cover_image']; ?>" alt="Cover of <?php echo htmlspecialchars($book['title']); ?>">
                                <h3 class="title"><?php echo htmlspecialchars($book['title']); ?></h3>
                            </a>
                            <p>by <?php echo htmlspecialchars($book['author']); ?></p>
                            <?php if ($userSettings['show_description']): ?>
                                <p><?php echo nl2br(htmlspecialchars($book['description'])); ?></p>
                            <?php endif; ?>
                            <a href="?favorite=1&book_id=<?php echo $book['book_id']; ?>" class="favorite-button">
                                <?php echo isFavorited($user_id, $book['book_id'], $conn) ? '❤️' : '🤍'; ?>
                            </a>
                        </div>
                    <?php endforeach;?>
                     
                </div>
            </section>
        <?php endif; 
        include 'chat.php';?>
    </div>
    

    <script src="asset/function.js"></script> <!-- External JS file -->
</body>
</html>
