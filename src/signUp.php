<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "taaltrainer";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if(isset($_POST['submit'])){
        $username = $_POST['username'];
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

        // Check if username already exists
        $check_sql = "SELECT * FROM users WHERE username = '$username'";
        $check_result = $conn->query($check_sql);

        if($check_result->num_rows > 0){
            echo "Username already exists";
        } else {
            $sql = "INSERT INTO users (username, email, PASSWORD) VALUES ('$username', NULL, '$password')";
            if($conn->query($sql) === TRUE){
                header("Location: login.php");
                exit();
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
    <link rel="stylesheet" href="css/SignLogin.css">
</head>
<body>
    <main>
        <section class="inlogSect">
            <div>
                <h1>Sign up</h1>
                <form action="signUp.php" method="post">
                    <label for="username">username</label>
                    <input type="text" name="username" id="username" required>
                    <label for="password">wachtwoord</label>
                    <input type="password" name="password" id="password" required>
                    <input type="submit" value="Sign up" name="submit">
                </form>
            </div>
        </section>
        <div>
            <p>Heb je al een account? <a href="login.php"><button>Log hier in</button></a></p>
        </div>
    </main>
</body>
</html>