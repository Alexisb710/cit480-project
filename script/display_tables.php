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

// Check if there are any tables
if ($result->num_rows > 0) {
    echo "<h2>Tables in database '$database':</h2>";
    echo "<ul>";

    // Output each table name
    while ($row = $result->fetch_array()) {
        echo "<li>" . $row[0] . "</li>";
        
        // Fetch and display the contents of each table
        $tableName = $row[0];
        $tableQuery = "SELECT * FROM $tableName";
        $tableResult = $conn->query($tableQuery);

        if ($tableResult->num_rows > 0) {
            echo "<table border='1'>";
            // Fetch column names
            $fields = $tableResult->fetch_fields();
            echo "<tr>";
            foreach ($fields as $field) {
                echo "<th>" . $field->name . "</th>";
            }
            echo "</tr>";

            // Fetch rows and display data
            while ($tableRow = $tableResult->fetch_assoc()) {
                echo "<tr>";
                foreach ($tableRow as $data) {
                    echo "<td>" . $data . "</td>";
                }
                echo "</tr>";
            }
            echo "</table><br>";
        } else {
            echo "<p>No data in this table.</p>";
        }
    }

    echo "</ul>";
} else {
    echo "No tables found in the database.";
}

// Close the connection
$conn->close();
?>
