<?php
    session_start();
    if(!isset($_SESSION['username'])){
        header("Location: login.php");
        exit();
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <a href="turkswoordenleren.php">woorden leren</a>
    <a href="turkscijfersleren.php">cijfers leren</a>
</body>
</html>