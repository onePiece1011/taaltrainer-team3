<?php
// Enforce login on pages that include this file.
// Include this at the very top of the page (before any HTML output).

session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
