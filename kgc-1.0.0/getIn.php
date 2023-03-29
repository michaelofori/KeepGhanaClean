<?php
session_start();

// Check if the user has submitted the form
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get the user's input from the form
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    // Check if the user's credentials are valid
    if ($username == 'myusername' && $password == 'mypassword') {
        // Store the user's ID in a session variable
        $_SESSION['user_id'] = 1;
        
        // Redirect the user to the home page
        header('Location: index.php');
        exit;
    } else {
        // If the credentials are invalid, show an error message
        $error = 'Invalid username or password.';
    }
}
?>