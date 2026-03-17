<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "taaltrainer";

    $conn = new mysqli($servername, $username, $password, $dbname);

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
    <title>Login</title>
    <link rel="stylesheet" href="css/SignLogin.css">
</head>
<body>
    <main>
        <section class="inlogSect">
            <div style="text-align:center" class=>  
                <h1>inloggen</h1>
                <form action="login.php" method="post">
                    <label for="username">username</label>
                    <input type="text" name="username" id="username" required><br><br>
                    <label for="password">wachtwoord</label>
                    <input type="password" name="password" id="password" required><br><br>
                    <input type="submit" id="btn" value="Login" name="submit">
                </form>
            </div>
        </section>
        <div>
            <p>Heb je nog geen account? <a href="signUp.php"><button>Maak hier aan</button></a></p>
        </div>
    </main>
    <?php
        if(isset($_POST['submit'])){
            $username = $_POST['username'];
            $password = $_POST['password'];

            $sql = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
            $result = $conn->query($sql);

            if($result->num_rows > 0){
                header("Location: index.php");
                echo "Login successful";
            } else {
               echo "Login failed";
            }
    }
    ?>
    <a href="index.php">test knop verwijderen</a>
</body>
</html>