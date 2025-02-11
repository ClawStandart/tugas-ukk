<?php
session_start();
require 'config.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Fetch user's most recently read book
$stmt = $conn->prepare("
    SELECT b.title, b.cover_image, h.access_time
    FROM History h
    JOIN Books b ON h.book_id = b.book_id
    WHERE h.user_id = :user_id
    ORDER BY h.access_time DESC
    LIMIT 1
");
$stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
$stmt->execute();
$latestBook = $stmt->fetch(PDO::FETCH_ASSOC);

// Fetch user's total books read
$totalBooksStmt = $conn->prepare("
    SELECT COUNT(*) AS total_books_read
    FROM History
    WHERE user_id = :user_id
");
$totalBooksStmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
$totalBooksStmt->execute();
$totalBooks = $totalBooksStmt->fetch(PDO::FETCH_ASSOC)['total_books_read'];

// Fetch user's most liked genre
$likedGenreStmt = $conn->prepare("
    SELECT b.genre, COUNT(b.genre) AS count
    FROM History h
    JOIN Books b ON h.book_id = b.book_id
    WHERE h.user_id = :user_id
    GROUP BY b.genre
    ORDER BY count DESC
    LIMIT 1
");
$likedGenreStmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
$likedGenreStmt->execute();
$mostLikedGenre = $likedGenreStmt->fetch(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Rizky's Library</title>
    <link rel="stylesheet" href="asset/style.css">
</head>
<body>
    <?php include 'asset/navbar.php'; ?>

    <div class="content">
        <h1>Welcome to Your Profile, <?php echo htmlspecialchars($_SESSION['username']); ?>!</h1>

        <section>
            <h2>Latest Book Read</h2>
            <?php if ($latestBook): ?>
                <div class="book-item">
                    <img src="<?php echo htmlspecialchars($latestBook['cover_image']); ?>" alt="Cover of <?php echo htmlspecialchars($latestBook['title']); ?>">
                    <h3><?php echo htmlspecialchars($latestBook['title']); ?></h3>
                    <p>Read on: <?php echo htmlspecialchars($latestBook['access_time']); ?></p>
                </div>
            <?php else: ?>
                <p>You haven't read any books yet!</p>
            <?php endif; ?>
        </section>

        <section>
            <h2>Total Books Read</h2>
            <p>You have read <?php echo $totalBooks; ?> books so far.</p>
        </section>

        <section>
            <h2>Most Liked Genre</h2>
            <?php if ($mostLikedGenre): ?>
                <p>Your favorite genre is: <strong><?php echo htmlspecialchars($mostLikedGenre['genre']); ?></strong>, with <?php echo $mostLikedGenre['count']; ?> books read.</p>
            <?php else: ?>
                <p>You haven't shown a preference for any genre yet!</p>
            <?php endif; ?>
        </section>
    </div>

    <script src="asset/function.js"></script>
</body>
</html>
