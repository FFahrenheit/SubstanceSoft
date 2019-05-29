<?php 
    $user = $_POST['user'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "UPDATE usuario SET tarjeta = NULL WHERE username = '$user'";

    mysqli_query($connection,$query) or die('"Error, no se pudo asignar esta tarjeta"');

    echo json_encode("Exito");

    mysqli_close($connection);
?>