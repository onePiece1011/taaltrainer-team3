<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
                </form>
            </div>
        </section>
        <div>
            <p>Heb je nog geen account? <button><a href="signUp.php">Maak hier aan</a></button></p>
        </div>
    </main>
</body>
</html>