<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se pudo conectar a la BD"');

    $nombre = $_POST['nombre'];
    $old = $_POST['old'];

    $query = "UPDATE proveedor SET nombre='$nombre' WHERE clave ='$old'";

    $result = mysqli_query($connection, $query) or die (' "Campos invalidos"');

    echo json_encode("Proveedor modificado. Regresando...");

    mysqli_close($connection);

?>
