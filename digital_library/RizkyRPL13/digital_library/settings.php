<?php
session_start();
require 'config.php';

// Ensure the user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

// Fetch user settings to check the current status of the "show_description" setting
$stmt = $conn->prepare("SELECT show_description FROM Users WHERE user_id = :user_id");
$stmt->bindParam(':user_id', $user_id);
$stmt->execute();
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// Handle form submission to update the user's settings
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $show_description = isset($_POST['show_description']) ? 1 : 0;

    // Update the user's preference in the database
    $stmt = $conn->prepare("UPDATE Users SET show_description = :show_description WHERE user_id = :user_id");
    $stmt->bindParam(':show_description', $show_description);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->execute();

    // Redirect to settings page to avoid form resubmission
    header("Location: settings.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Settings</title>
    <link rel="stylesheet" href="asset/style.css">
</head>
<body>
    <?php include 'asset/navbar.php'; ?>

    <div class="settings-container">
        <h2>User Settings</h2>
        <form method="POST">
            <label for="show_description">
                <input type="checkbox" name="show_description" id="show_description" <?php echo $user['show_description'] ? 'checked' : ''; ?>>
                Show Book Descriptions on Home Page
            </label>
            <br>
            <input type="submit" value="Save Settings">
        </form>
    </div>
</body>
</html>
