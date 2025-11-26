<?php
// Database connection details
$servername = "localhost";
$username = "root"; // default user for XAMPP
$password = "";     // default has no password
$dbname = "hostel"; // the name you created

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data safely
$name = $_POST['name'];
$email = $_POST['email'];
$subject =$_POST['subject'];
$message =$_POST['message'];

// Insert into database
$sql = "INSERT INTO messages (name, email, subject, message)
        VALUES ('$name', '$email', '$subject', '$message')";

if ($conn->query($sql) === TRUE) {
    echo "Thank you! Your message has been sent successfully.";
    header("Location: home.html");
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close connection
$conn->close();
?>
