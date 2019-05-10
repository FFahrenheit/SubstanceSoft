<?php 
    $origen = $_POST['origen'];
    $destino = $_POST['destino'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

    $query = "UPDATE platillo SET cocina = 
    (SELECT clave FROM cocina WHERE nombre = '$destino') WHERE cocina =  
    (SELECT clave FROM cocina WHERE nombre = '$origen')";

    $result = mysqli_query($connection, $query) or die("error");

    $query = "DELETE FROM cocina WHERE nombre='$origen'";

    $result = mysqli_query($connection, $query) or die("error");

    mysqli_close($connection);
?>