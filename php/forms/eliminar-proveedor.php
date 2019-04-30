<?php
    $clave = $_POST['clave'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha conectar"');

    $query = "DELETE FROM proveedor WHERE clave = '$clave'";

    $result = mysqli_query($connection, $query) or die('"Proveedor invalido"');

    echo json_encode("Exito!");

    mysqli_close($connection);
?>
