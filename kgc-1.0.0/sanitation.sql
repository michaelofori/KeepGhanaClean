CREATE DATABASE sanitation;

CREATE TABLE users (
  id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(30) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL
);

<?php
// Connect to MySQL
$servername = "localhost";
$username = "yourusername";
$password = "yourpassword";
$dbname = "sanitation";
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// Get user input from registration form
$username = $_POST["username"];
$email = $_POST["email"];
$password = password_hash($_POST["password"], PASSWORD_DEFAULT);

// Check if username or email already exists in database
$sql = "SELECT * FROM users WHERE username='$username' OR email='$email'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) {
  echo "Username or email already exists";
} else {
  // Insert user data into database
  $sql = "INSERT INTO users (username, email, password) VALUES ('$username', '$email', '$password')";
  if (mysqli_query($conn, $sql)) {
    echo "Registration successful";
  } else {
    echo "Error: " . mysqli_error($conn);
  }
}

// Close MySQL connection
mysqli_close($conn);
?>
