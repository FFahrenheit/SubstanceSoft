<?php 
    $id = $_POST['nombre'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');
    mysqli_set_charset($connection,"utf8");
    $query = "SELECT * FROM platillo WHERE nombre = '$id'";

    $result = mysqli_query($connection,$query);

    if($row = mysqli_fetch_array($result))
    {
        $output = '<p style="color: #000;">Platillo actual: 
        '.$row['nombre'].'</p>';
        $output.='<img width="20%" src="https://sifu.unileversolutions.com/image/es-ES/recipe-topvisual/2/1260-709/hamburguesa-new-york-classic-50243210.jpg">';
        $output.='<p class="comm" style="color: #000;">'.$row['descripcion'].'</p>';
        echo $output;
    }
    else 
    {
        $output = '<p class="comm" style="color: #000;">Error al obtener información</p>';
        echo $output;
    }

    mysqli_close($connection);
    return $output;
?>