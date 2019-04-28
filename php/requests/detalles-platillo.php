<?php 
    $id = $_POST['nombre'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');
    mysqli_set_charset($connection,"utf8");
    $query = "SELECT * FROM platillo WHERE nombre = '$id'";

    $result = mysqli_query($connection,$query);

    if($row = mysqli_fetch_array($result))
    {
        $output = '<p style="color: #000;">Platillo actual: <strong>
        '.$row['nombre'].'</strong></p>';
        if($row['imagen']=='')
        {
            $output.='<img height="90" src="/../substancesoft/images/platillo.png">';
        }
        else
        {
            $output.='<img height="90" src="data:image/jpeg;base64,'.base64_encode($row['imagen'] ).'">';
        }
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