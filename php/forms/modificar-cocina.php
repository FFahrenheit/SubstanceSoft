<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se pudo conectar a la BD"');

    $nombre = $_POST['nombre'];
    $old = $_POST['old'];

    $query = "UPDATE cocina SET nombre='$nombre' WHERE nombre ='$old'";

    $result = mysqli_query($connection, $query) or die (' "Cocina repetida o campos invalidos. Reintente"');

    echo json_encode("Cocina modificada. Regresando...");

    mysqli_close($connection);

?>
