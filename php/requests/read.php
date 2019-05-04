<?php
    /*
    HTTP request for read on Arduino module
    and insert into database.
    -0 equals error.
    -1 equals success
    */
    $code = $_GET['code'];
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("0");
    $query = "INSERT INTO login_automatico(usuario) VALUES 
    ((SELECT username FROM usuario WHERE codigo=$code))";
    $result = mysqli_query($connection, $query) or die("0");
    echo "1";
    mysqli_close($connection);
?>