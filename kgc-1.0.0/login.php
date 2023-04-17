<!DOCTYPE html>
<html>
  <head>
    <title>Login Page</title>
    <style>
      /* Center align the form */
      form {
        max-width: 400px;
        margin: auto;
        text-align: center;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        font-family: Arial, sans-serif;
        position: relative;
        z-index: 1;
      }

      /* Style the container element */
      .container {
        background-image: url("images/hand-sanitizer-gffcdc7c86_1920.png");
        background-repeat: no-repeat;
        background-size: cover;
        height: 100vh;
        position: relative;
        z-index: 0;
      }

      /* Style the form elements */
      input[type=text], input[type=password], input[type=email], select, textarea {
        width: 100%;
        padding: 12px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        font-size: 16px;
        color: #333;
      }

      input[type=submit], .google-button {
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 10px;
        margin-bottom: 20px;
      }

      input[type=submit]:hover, .google-button:hover {
        background-color: #45a049;
      }

      .google-button {
        background-color: #dd4b39;
      }

      label {
        font-size: 18px;
        font-weight: bold;
        text-align: left;
        display: block;
        margin-bottom: 5px;
        color: #555;
      }

      /* Semi-transparent background overlay */
      .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(255, 255, 255, 0.9);
        z-index: -1;
      }
    </style>
  </head>

  <body>
    <div class="container">
      <div class="overlay"></div>
      <h1 style="text-align:center; font-family: Arial, sans-serif; color: #fff;">Login</h1>
      <form action="login_process.php" method="POST">
        <label for="email_or_username">Email or Username:</label>
        <input type="text" id="email_or_username" name="email_or_username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="remember_me">Remember Me:</label>
        <input type="checkbox" id="remember_me" name="remember_me">

        <input type="submit" value="Login">
        <a href="https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=YOUR_CLIENT_ID&redirect_uri=YOUR_REDIRECT_URI
      </form>
       <p><a href="signup.html">Don't have an account? Sign up here!</a></p>
    </body>
</html>