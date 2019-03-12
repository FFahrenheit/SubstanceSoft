<?php
    $clave = $_POST['user'];
    
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "update orden set estado='cerrada' where clave = $clave ";

    $result = mysqli_query($connection, $query) or die ("Error al cerrar platillos");

    $query = "update pedidos set estado='entregado' where orden = $clave ";

    $result = mysqli_query($connection, $query) or die ('"Error al cerrar platillos"');

    echo json_encode("Okay!");

    mysqli_close($connection);
?>