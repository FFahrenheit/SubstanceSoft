<?php
    $function = $_POST['function'];
    $username = $_POST['username'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "insert into permisos(username, permiso) values ('$username', $function)";

    $result = mysqli_query($connection, $query) or die ('"Error al agregar"');

    echo json_encode("Permiso agregado");
?>