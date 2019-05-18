<?php 
    $clave = $_POST['clave'];
    $total = $_POST['total'];



    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "UPDATE orden SET total = $total WHERE clave = $clave";

    $result = mysqli_query($connection, $query) or die ('"Error al modificar"');

    echo json_encode("Exito");

    mysqli_close($connection);
?>