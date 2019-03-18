<?php
    $nombre = $_POST['nombre'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha conectar"');

    $query = "DELETE FROM cocina WHERE nombre='$nombre'";

    $result = mysqli_query($connection, $query) or die('"Usuario invalido"');

    echo json_encode("Exito!");

    mysqli_close($connection);
?>
