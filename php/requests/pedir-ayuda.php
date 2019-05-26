<?php 
    $req = $_POST['cocina'];
    $res = $_POST['solicitante'];
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");
    $query = "INSERT INTO ayuda(solicitante, solicitado) VALUES ($req,$res)";
    mysqli_query($connection,$query) or die("Error al pedir ayuda");
    mysqli_close($connection);
    echo "Ayuda pedida";
?>