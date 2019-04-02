<?php
    $ingredient = $_POST['ing'];
    $frequency = $_POST['frec'];
    $qty = $_POST['qty'];
    $provider = $_POST['proveedor'];

    $trigger = "trigI".$ingredient."P".$provider;

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "INSERT INTO surtidos (clave, cantidad, frecuencia, ingrediente, proveedor, nombre_trigger) 
    VALUES (NULL, $qty , $frequency, $ingredient, $provider, '$trigger')";

    $result = mysqli_query($connection, $query) or die ('"Error al agregar"');

    echo json_encode("Surtido fijo agregado");

    mysqli_close($connection);
?>