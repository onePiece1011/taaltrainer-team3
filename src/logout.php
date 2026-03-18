<?php
session_start();

// Clear all session data and end the session
session_unset();
session_destroy();

// Redirect to the login page
header("Location: login.php");
exit();
