<?php
    $key = $_POST['user'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha podido conectar"');

    $query = "SELECT nombre_trigger FROM surtidos WHERE clave=$key";

    $result = mysqli_query($connection, $query) or die('"Query trigger"');

    $row = mysqli_fetch_array($result);

    $trigger = $row['nombre_trigger'];

    $query = "DROP EVENT $trigger";

    $result = mysqli_query($connection, $query) or die('"Query drop trigger"');
    
    $query = "DELETE FROM surtidos WHERE clave=$key";

    $result = mysqli_query($connection, $query) or die('"Query"');

    echo json_encode("Exito!");
    
    mysqli_close($connection);
?>