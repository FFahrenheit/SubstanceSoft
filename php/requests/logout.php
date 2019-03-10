<?php 
    session_start();
    unset($_SESSION['username']);
    header("Location: /substancesoft/views/menus/login.html");
    exit();
?>