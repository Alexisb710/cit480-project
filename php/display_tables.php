<?php
// Database connection details
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

// Fetch all tables in the database
$sql = "SHOW TABLES";
$result = $conn->query($sql);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MySQL Tables</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 20px;
        }
        h2 {
            color: #007bff;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #dee2e6;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

<?php
// Check if there are tables
if ($result->num_rows > 0) {
    while ($row = $result->fetch_array()) {
        $table_name = $row[0];
        echo "<div class='table-container'>";
        echo "<h2><i class='fas fa-table'></i> Table: '$table_name'</h2>";

        // Query to get all records from the current table
        $data_sql = "SELECT * FROM `$table_name`";
        $data_result = $conn->query($data_sql);

        // Check if there are records and display them
        if ($data_result->num_rows > 0) {
            echo "<table>";
            echo "<thead><tr>";

            // Get column names for the table header
            while ($field_info = $data_result->fetch_field()) {
                echo "<th>" . htmlspecialchars($field_info->name) . "</th>";
            }
            echo "</tr></thead><tbody>";

            // Fetch records
            $data_result->data_seek(0); // Reset the pointer
            while ($data_row = $data_result->fetch_assoc()) {
                echo "<tr>";
                foreach ($data_row as $data) {
                    echo "<td>" . htmlspecialchars($data) . "</td>";
                }
                echo "</tr>";
            }
            echo "</tbody></table>";
        } else {
            echo "<p>No records found in the table '$table_name'.</p>";
        }

        echo "</div>";
    }
} else {
    echo "<p>No tables found in the database.</p>";
}
$conn->close();
?>
</body>
</html>
