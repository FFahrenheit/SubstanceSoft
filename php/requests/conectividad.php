<?php 
    if(!isset($_POST['ip']))
    {
        echo json_encode("success");
        die();
    }
    $ip = $_POST['ip'];

    if(isset($_POST['alias']))
    {
        $alias = $_POST['alias'];
        $query = "INSERT INTO equipos(ip, alias) VALUES ('$ip','$alias') 
        ON DUPLICATE KEY UPDATE conexion = NOW(), alias = '$alias'";
    }
    else 
    {
        $query = "INSERT INTO equipos(ip) VALUES ('$ip') ON DUPLICATE KEY UPDATE conexion = NOW()";
    }

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"error"');

    $result = mysqli_query($connection,$query) or die('"error"');

    mysqli_close($connection) or die("error");

    echo json_encode("success");
?>