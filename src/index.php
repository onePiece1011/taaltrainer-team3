<?php
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "mydb";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <main>
        <section class="inlogSect">
            <div style="text-align:center">  
                <h1>inloggen</h1>
                <form action="login.php" method="post">
                <label for="username">username</label>
                <input type="username" name="username" id="username" required>
                <label for="password">wachtwoord</label>
                <input type="password" name="password" id="password" required>
                <input type="submit" value="inloggen">
            </div>  
            </form>
        </section>
    </main>
</body>
</html>