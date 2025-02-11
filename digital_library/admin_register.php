<?php
session_start();
require 'config.php';

// Check if user is logged in and is an admin
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: login.php");
    exit;
}

// Register a new user (Admin or Staff)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['register'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $role = $_POST['role'];

    if (empty($username) || empty($password)) {
        $error = "Username and password are required.";
    } else {
        // Check if username already exists
        $stmt = $conn->prepare("SELECT * FROM Users WHERE username = :username");
        $stmt->bindParam(':username', $username);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $error = "Username already exists.";
        } else {
            // Hash the password before storing it
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

            // Insert the new admin/staff into the database
            $stmt = $conn->prepare("INSERT INTO Users (username, password, role) VALUES (:username, :password, :role)");
            $stmt->bindParam(':username', $username);
            $stmt->bindParam(':password', $hashedPassword);
            $stmt->bindParam(':role', $role);
            $stmt->execute();

            $success = "User registered successfully!";
        }
    }
}

// Update user role
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_role'])) {
    $user_id = $_POST['user_id'];
    $new_role = $_POST['new_role'];

    // Ensure the role is either 'admin' or 'staff'
    if (!in_array($new_role, ['admin', 'staff'])) {
        $error = "Invalid role selected.";
    } else {
        // Prevent changing the role of the current admin
        if ($user_id == $_SESSION['user_id']) {
            $error = "You cannot change your own role.";
        } else {
            $stmt = $conn->prepare("UPDATE Users SET role = :role WHERE user_id = :user_id");
            $stmt->bindParam(':role', $new_role, PDO::PARAM_STR);
            $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
            $stmt->execute();
            $success = "User role updated successfully!";
        }
    }
}

// Fetch all users (admin & staff)
$stmt = $conn->prepare("SELECT user_id, username, role FROM Users WHERE role IN ('admin', 'staff','user')");
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link rel="stylesheet" href="asset/style.css">
</head>
<body>
    <?php include 'asset/navbar.php'; ?>

    <div class="content">
        <h1>Register a New Admin or Staff</h1>

        <!-- Display any success or error messages -->
        <?php if (isset($error)): ?>
            <p style="color: red;"><?php echo $error; ?></p>
        <?php elseif (isset($success)): ?>
            <p style="color: green;"><?php echo $success; ?></p>
        <?php endif; ?>

        <!-- Admin Registration Form -->
        <form action="admin_register.php" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="role">Role:</label>
            <select name="role" id="role" required>
                <option value="admin">Admin</option>
                <option value="staff">Staff</option>
            </select>

            <button type="submit" name="register">Register</button>
        </form>

        <h2>List of Admins and Staff</h2>
        <table border="1">
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
            <?php foreach ($users as $user): ?>
                <tr>
                    <td><?php echo $user['user_id']; ?></td>
                    <td><?php echo htmlspecialchars($user['username']); ?></td>
                    <td><?php echo ucfirst($user['role']); ?></td>
                    <td>
                        <!-- Role Update Form -->
                        <form action="admin_register.php" method="POST" style="display: inline;">
                            <input type="hidden" name="user_id" value="<?php echo $user['user_id']; ?>">
                            <select name="new_role">
                                <option value="admin" <?php if ($user['role'] === 'admin') echo 'selected'; ?>>Admin</option>
                                <option value="staff" <?php if ($user['role'] === 'staff') echo 'selected'; ?>>Staff</option>
                            </select>
                            <button type="submit" name="update_role">Update</button>
                        </form>
                    </td>
                </tr>
            <?php endforeach; ?>
        </table>
    </div>

</body>
</html>
