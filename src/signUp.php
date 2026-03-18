<?php
    session_start();
    include 'DatabaseConnect.php';
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
                <h1 class="titleLog">Sign up</h1>
                <form action="signUp.php" method="post">
                    <label for="username">username</label>
                    <input type="text" name="username" id="username" required>
                    <label for="password">wachtwoord</label>
                    <input type="password" name="password" id="password" required>
                    <input type="submit" id="btn" value="Sign up" name="submit">
                </form>
                <?php
                    if(isset($_POST['submit'])){
                        $username = $_POST['username'];
                        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

                        $check_sql = $conn->prepare("SELECT * FROM users WHERE username = ?");
                        $check_sql->bind_param("s", $username);
                        $check_sql->execute();
                        $check_result = $check_sql->get_result();

                        if($check_result->num_rows > 0){
                            echo "Username already exists";
                        } else {
                            $sql = $conn->prepare("INSERT INTO users (username, PASSWORD) VALUES (?, ?)");
                            $sql->bind_param("ss", $username, $password);
                            if($sql->execute()){
                                header("Location: index.php");
                                exit();
                            } else {
                                    echo "Error: " . $sql->error;
                            }
                        }
                    }
                ?>
            </div>
        </section>
        <div>
            <p>Heb je al een account? <a href="login.php"><button>Log hier in</button></a></p>
        </div>
    </main>
</body>
</html>