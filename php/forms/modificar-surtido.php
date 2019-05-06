<?php
    $key = $_POST['user'];
    $qty = $_POST['quantity'];
    $frc = $_POST['frequency'];
    $ingredient = $_POST['ing'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha podido conectar"');

    $query = "SELECT nombre_trigger FROM surtidos WHERE clave=$key";

    $result = mysqli_query($connection, $query) or die('"Query trigger"');

    $row = mysqli_fetch_array($result);

    $trigger = $row['nombre_trigger'];

    $query = "UPDATE surtidos SET cantidad = $qty, frecuencia = $frc WHERE clave=$key";

    $result = mysqli_query($connection, $query) or die('"Query"');

    $query = "ALTER EVENT $trigger ON SCHEDULE EVERY $frc DAY STARTS CURRENT_TIMESTAMP ON
    COMPLETION PRESERVE ENABLE DO UPDATE ingrediente SET cantidad = cantidad + $qty WHERE
    clave = $ingredient";

    $result = mysqli_query($connection,$query) or die("'Error de trigger'");

    echo json_encode("Surtido fijo modificado");

    mysqli_close($connection);
?>
