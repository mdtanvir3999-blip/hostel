<?php
// Database connection
$host = "localhost";
$username = "root";
$password = "";
$database = "hostel";

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Get form data
$username = $_POST['username'];  // In this case, it's the email
$password = $_POST['password'];

// Find user
$sql = "SELECT * FROM login WHERE fullname = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 1) {
  $user = $result->fetch_assoc();

  if (password_verify($password, $user['password'])) {
    echo "Login successful. Welcome, " . $user['fullname'] . "!";
      header("Location: home.html");

    // You can redirect or start session here
  } else {
    echo "Incorrect password.";
    header("Location: user login.html");

  }
} else {
  echo "User not found.";
   header("Location: register.html");
}

$stmt->close();
$conn->close();
?>
