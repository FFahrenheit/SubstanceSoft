<?php
    $function = $_POST['function'];
    $username = $_POST['username'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "insert into chefs(usuario, cocina) values ('$username', $function)";

    $result = mysqli_query($connection, $query) or die ('"Error al agregar"');

    echo json_encode("Cocina agregada");

    mysqli_close($connection);
?>