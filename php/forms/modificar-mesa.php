<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se pudo conectar a la BD"');

    $numero = $_POST['numero'];
    $capacidad = $_POST['capacidad'];
    $old = $_POST['old'];

    $query = "UPDATE mesa SET numero='$numero', capacidad='$capacidad' WHERE numero ='$old'";

    $result = mysqli_query($connection, $query) or die (' "Campos invalidos"');

    echo json_encode("Mesa modificada. Regresando...");

    mysqli_close($connection);

?>
