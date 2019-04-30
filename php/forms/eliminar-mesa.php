<?php
    $clave = $_POST['numero'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha conectar"');

    $query = "DELETE FROM mesa WHERE numero = '$clave'";

    $result = mysqli_query($connection, $query) or die('"Mesa invalida"');

    echo json_encode("Exito!");

    mysqli_close($connection);
?>
