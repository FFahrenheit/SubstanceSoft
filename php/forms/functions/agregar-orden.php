<?php
    session_start();
    $description = $_POST['desc'];
    $mesa = $_POST['mesa'];
    $user = $_SESSION['username'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "insert into orden(mesa, usuario, descripcion,estado) values ($mesa, '$user','$description','abierta')";

    $result = mysqli_query($connection, $query) or die ('"Error al agregar"');

    echo json_encode("Exito");

    mysqli_close($connection);
?>