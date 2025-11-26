<?php
// Database configuration
$host = 'localhost';      // or 127.0.0.1
$dbname = 'hostel';
$username = 'root';       // default for XAMPP
$password = '';           // default is empty for root in XAMPP

// Create connection
$conn = new mysqli($host, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Success message
echo "Connected successfully!";
?>
