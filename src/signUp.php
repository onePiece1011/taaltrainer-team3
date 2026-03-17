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
                <form action="login.php" method="post">
                    <label for="username">username</label>
                    <input type="username" name="username" id="username" required>
                    <label for="password">wachtwoord</label>
                    <input type="password" name="password" id="password" required>
                    <input type="submit" value="inloggen">
                </form>
            </div>
        </section>
        <div>
            <p>Heb je al een account? <button><a href="login.php">Log hier in</a></button></p>
        </div>
    </main>
</body>
</html>