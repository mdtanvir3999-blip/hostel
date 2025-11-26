<?php
// Database connection
$host = "localhost";
$username = "root";
$password = "";
$database = "hostel";

// Connect to MySQL
$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Get data from form
$fullname = $_POST['fullname'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$gender = $_POST['gender'];
$password = $_POST['password'];
$confirm_password = $_POST['confirm_password'];

// Password match check
if ($password !== $confirm_password) {
  die("Passwords do not match.");
}

// Hash password
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Insert into database
$sql = "INSERT INTO login (fullname, email, phone, gender, password) 
        VALUES (?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sssss", $fullname, $email, $phone, $gender, $hashed_password);

if ($stmt->execute()) {
  echo "Registration successful.";
  header("Location: user login.html");


}
 else {
  echo "Error: " . $stmt->error;
  
}

$stmt->close();
$conn->close();
?>
