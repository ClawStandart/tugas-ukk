<?php
session_start();
if (!isset($_SESSION['user_id']) || !in_array($_SESSION['role'], ['admin', 'staff'])) {
    header("Location: login.php");
    exit;
}
require 'config.php';

// Example: Generate a simple report, such as total number of books
$result = $conn->query("SELECT COUNT(*) AS total_books FROM Books");
$data = $result->fetch(PDO::FETCH_ASSOC);
$totalBooks = $data['total_books'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report - Digital Library</title>
    <link rel="stylesheet" href="asset/style.css">
</head>
<body>
    <?php include 'asset/navbar.php'; ?>
    <div class="content">
        <h1>Library Report</h1>
        <p>Total Number of Books: <?php echo $totalBooks; ?></p>
        <!-- Additional report metrics can be added here -->
    </div>
</body>
</html>
