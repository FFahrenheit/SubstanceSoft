<?php 
    $qty = $_POST['qty'];
    $id = $_POST['id'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "UPDATE ingrediente SET cantidad = cantidad + $qty WHERE clave = $id";

    $result = mysqli_query($connection, $query) or die ('"Error al agregar"');

    echo json_encode("Exito");

    mysqli_close($connection);
?>