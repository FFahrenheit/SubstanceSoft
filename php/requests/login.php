<?php
    $username = $_POST['username'];
    $password = $_POST['password'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');

    $query = "SELECT password from usuario where username='$username'"; 

    $result = mysqli_query($connection, $query) or die ('"query"');

    $row = mysqli_fetch_array($result); 

    if(isset($row['password']))
    {
        $pass = $row['password'];
    }
    else
    {
        echo json_encode("user");
        die;
    }

    if($pass == $password)
    {
        echo json_encode("success");
        session_start();
        $_SESSION['username'] = $password;
        $_SESSION['password'] = $username;
    }
    else
    {
        echo json_encode("password");
    }
?>