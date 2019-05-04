<?php
    /*
    HTTP request for Arduino module.
    -0 equals error.
    */
    $code = $_GET['code'];
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("0");
    $query = "SELECT username FROM usuario WHERE codigo=$code";
    $result = mysqli_query($connection, $query) or die("0");
    if($result->num_rows==1)
    {
        $row = mysqli_fetch_array($result);
        echo $row['username'];
    }
    else 
    {
        echo "0";
    }
    mysqli_close($connection);
?>