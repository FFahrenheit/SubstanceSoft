<?php 
    //Condiciones de listo
    //Por mientras se prueba la conexión a la base de datos
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error");
    mysqli_close($connection) or die("error");
    echo json_encode("success");
?>