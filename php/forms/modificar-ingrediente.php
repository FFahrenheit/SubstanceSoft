<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se pudo conectar a la BD"');

    $nombre = $_POST['nombre'];
    $cantidad = $_POST['cantidad'];
    $esp = $_POST['esp'];
    $ex_crt = $_POST['existencia_critica'];
    $old = $_POST['old'];

    $query = "UPDATE ingrediente SET nombre='$nombre', cantidad='$cantidad', especificacion='$esp', existencia_critica='$ex_crt' WHERE clave ='$old'";

    $result = mysqli_query($connection, $query) or die (' "Campos invalidos"');

    echo json_encode("Ingrediente modificada. Regresando...");

    mysqli_close($connection);

?>
