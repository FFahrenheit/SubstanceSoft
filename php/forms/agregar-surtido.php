<?php
    $ingredient = $_POST['ing'];
    $frequency = $_POST['frec'];
    $qty = $_POST['qty'];
    $provider = $_POST['proveedor'];

    $trigger = "triggerIng".$ingredient."Prov".$provider;

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "INSERT INTO surtidos (clave, cantidad, frecuencia, ingrediente, proveedor, nombre_trigger) 
    VALUES (NULL, $qty , $frequency, $ingredient, $provider, '$trigger')";

    $result = mysqli_query($connection, $query) or die ('"Error al agregar"');

    $query = "SELECT NOW() AS hora";

    $result = mysqli_query($connection,$query);

    $row = mysqli_fetch_array($result);

    $fecha = $row['hora'];


    $query = "CREATE EVENT $trigger ON SCHEDULE EVERY $frequency DAY STARTS  '$fecha' ON 
    COMPLETION PRESERVE ENABLE DO UPDATE ingrediente SET cantidad = cantidad + $qty WHERE 
    clave = $ingredient";

    $result = mysqli_query($connection,$query) or die("'Error de trigger'"); 

    echo json_encode("Surtido fijo agregado");

    mysqli_close($connection);
?>