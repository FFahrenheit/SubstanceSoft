<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $num = $_POST['num'];
    $tam = $_POST['tam'];

    $query = "INSERT INTO mesa (numero, capacidad)  VALUES ($num, $tam)";

    $result = mysqli_query($connection, $query) or die('"Error en query"');

    echo json_encode("ok");

    mysqli_close($connection);
?>
