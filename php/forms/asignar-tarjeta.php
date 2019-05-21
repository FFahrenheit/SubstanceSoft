<?php 
    $user = $_POST['user'];
    $code = $_POST['code'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "UPDATE usuario SET tarjeta = $code WHERE username = '$user'";

    mysqli_query($connection,$query) or die('"Error, no se pudo asignar esta tarjeta"');

    echo json_encode("Exito");

    mysqli_close($connection);
?>