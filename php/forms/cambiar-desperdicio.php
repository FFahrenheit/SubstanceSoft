<?php 
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha conectar"');

    $rate = $_POST['rate'];

    $query = "UPDATE preferencias SET valor = $rate WHERE nombre='razon_desperdicio'";

    mysqli_query($connection,$query) or die("'Error al cambiar razón'");

    echo json_encode("exito");
?>