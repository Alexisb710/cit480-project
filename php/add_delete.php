<?php
$servername = "localhost";
$username = "admin";  // replace with your MySQL username
$password = "password";  // replace with your MySQL password
$database = "cit480_db";  // replace with your MySQL database name

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle Create operation (Add a new user)
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['create'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $phone = $_POST['phone'];
    $role = $_POST['role'];

    $sql = "INSERT INTO Users (Name, Email, Password, Phone, Role) VALUES ('$name', '$email', '$password', '$phone', '$role')";
    if ($conn->query($sql) === TRUE) {
        echo "New user added successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}


// Handle Delete operation
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $sql = "DELETE FROM Users WHERE User_ID=$id";
    if ($conn->query($sql) === TRUE) {
        echo "User deleted successfully!";
    } else {
        echo "Error deleting user: " . $conn->error;
    }
}

// Fetch all users
$sql = "SELECT * FROM Users";
$result = $conn->query($sql);

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Add & Delete</title>
</head>
<body>

<h2>Manage Users</h2>

<!-- Create new user form -->
<h3>Add New User</h3>
<form method="POST">
    <label for="name">Name:</label>
    <input type="text" name="name" required><br><br>

    <label for="email">Email:</label>
    <input type="email" name="email" required><br><br>

    <label for="password">Password:</label>
    <input type="password" name="password" required><br><br>

    <label for="phone">Phone:</label>
    <input type="text" name="phone" required><br><br>

    <label for="role">Role:</label>
    <input type="text" name="role" required><br><br>

    <button type="submit" name="create">Add User</button>
</form>

<!-- Display users -->
<h3>Existing Users</h3>
<table border="1" cellpadding="10">
    <thead>
        <tr>
            <th>User_ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Password</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <?php
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                    <td>{$row['User_ID']}</td>
                    <td>{$row['Name']}</td>
                    <td>{$row['Email']}</td>
                    <td>{$row['Password']}</td>
                    <td>{$row['Phone']}</td>
                    <td>{$row['Role']}</td>
                    <td>
                        <a href='add_delete.php?delete={$row['User_ID']}'>Delete</a>
                    </td>
                </tr>";
            }
        } else {
            echo "<tr><td colspan='7'>No users found</td></tr>";
        }
        ?>
    </tbody>
</table>

</body>
</html>

<?php
// Close connection
$conn->close();
?>
