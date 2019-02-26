<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $name = $_POST['nom'];
    $quantity = $_POST['cnt'];
    $esp = $_POST['esp'];
    $ecrt = $_POST['ecrt'];

    $query = "INSERT INTO ingrediente (nombre, cantidad, especificacion, existencia_critica)
    VALUES ('$name', '$quantity', '$esp', '$ecrt')";

    $result = mysqli_query($connection, $query) or die('"Error en query"');

    echo json_encode("Exito!");

    mysqli_close($connection);
?>
