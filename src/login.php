<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "taaltrainer";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    echo "";

    $error = "";

    if(isset($_POST['submit'])){
        $username = $_POST['username'];
        $password = $_POST['password'];

        $sql = $conn->prepare("SELECT * FROM users WHERE username = ?");
        $sql->bind_param("s", $username);
        $sql->execute();
        $result = $sql->get_result();

        if($result->num_rows > 0){
            $row = $result->fetch_assoc();
            if(password_verify($password, $row['PASSWORD'])){
                header("Location: index.php");
                exit();
            } else {
                $error = "Invalid password";
            }
        } else {
            $error = "User not found";
        }
    }
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
                <h1 class="titleLog">inloggen</h1>
                <form method="post">
                    <label for="username">username</label>
                    <input type="text" name="username" id="username" required>
                    <label for="password">wachtwoord</label>
                    <input type="password" name="password" id="password" required>
                    <input type="submit" id="btn" value="Login" name="submit">
                </form>
                <?php
                    echo $error;
                ?>
            </div>
        </section>
        <div>
            <p>Heb je nog geen account? <a href="signUp.php"><button>Maak hier aan</button></a></p>
        </div>
    </main>
</body>
</html>