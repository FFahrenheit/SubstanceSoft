<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

    $nom = $_POST['nom'];

    $query = "INSERT INTO proveedor (nombre) VALUES ('$nom')";

    $result = mysqli_query($connection, $query);

    echo json_encode("Exito!");

    mysqli_close($connection);
?>
