<?php 
    if(!isset($_POST['ip']))
    {
        echo json_encode("success");
        die();
    }
    $ip = $_POST['ip'];
    //Condiciones de listo
    //Por mientras se prueba la conexión a la base de datos
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"error"');

    $query = "INSERT INTO equipos(ip) VALUES ('$ip') ON DUPLICATE KEY UPDATE conexion = NOW()";

    $result = mysqli_query($connection,$query) or die('"error"');

    mysqli_close($connection) or die("error");

    echo json_encode("success");
?>