<?php
// Database credentials
$servername = "localhost";
$username = "root"; // default user for XAMPP
$password = "";     // default has no password
$dbname = "hostel"; // the name you created

// Connect to the database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve and sanitize form data
$roomType = $_POST['roomType'];
$fullName = $_POST['fullName'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$checkIn = $_POST['checkIn'];
$checkOut = $_POST['checkOut'];
$guests = $_POST['guests'];

// Insert data into the table
$sql = "INSERT INTO booking (room_type, full_name, email, phone, check_in, check_out, guests)
        VALUES (?, ?, ?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("ssssssi", $roomType, $fullName, $email, $phone, $checkIn, $checkOut, $guests);

if ($stmt->execute()) {
    echo "Thank you! Your message has been sent successfully.";
    header("Location: home.html");
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
