<?php
// connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sanitationGH";

$conn = mysqli_connect($servername, $username, $password, $dbname);

// check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// get form data
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];
$confirm_password = $_POST['confirm_password'];

// validate form data
if ($password !== $confirm_password) {
  echo "Passwords do not match";
} else {
  // insert user into database
  $sql = "INSERT INTO users (username, email, password)
          VALUES ('$username', '$email', '$password')";

  if (mysqli_query($conn, $sql)) {
    echo "User created successfully";
  } else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }
}

// close database connection
mysqli_close($conn);
?>
