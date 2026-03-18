<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "taaltrainer_t3";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
?>