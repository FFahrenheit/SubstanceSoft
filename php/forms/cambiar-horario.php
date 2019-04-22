<?php 
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha conectar"');

    $enc = $_POST['encendido'];
    $apa = $_POST['apagado'];

    $query = "UPDATE fechas SET valor = (SELECT CONCAT(DATE(NOW()),' ','$enc',':00')) WHERE nombre='Encendido'";

    mysqli_query($connection,$query) or die("'Error en encendido'");

    $query = "UPDATE fechas SET valor = (SELECT CONCAT(DATE(NOW()),' ','$apa',':59')) WHERE nombre='Apagado'";

    mysqli_query($connection,$query) or die("'Error en apagado'");

    echo json_encode("exito");
?>