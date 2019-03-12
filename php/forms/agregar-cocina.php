<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $name = $_POST['nom'];

    $query = "INSERT INTO cocina (nombre)
    VALUES ('$name')";

    $result = mysqli_query($connection, $query) or die('"Error en query"');

    echo json_encode('Exito!');

    mysqli_close($connection);
?>
