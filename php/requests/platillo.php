<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    if(isset($_POST['consulta']))
    {
        $search = $_POST['consulta'];
        $query = "SELECT * FROM platillo 
        WHERE nombre LIKE '%$search%' OR descripcion LIKE '%$search%' 
        ORDER BY nombre ASC";
    }
    else if(isset($_POST['categoria']))
    {
        $search = $_POST['categoria'];
        $query = "SELECT * FROM platillo WHERE categoria = '$search' ORDER BY nombre ASC";
    }
    else
    {
        $query = "SELECT * FROM platillo ORDER BY nombre ASC LIMIT 10";
    }

    $result = mysqli_query($connection, $query) or die ("Error en query");

    if($result->num_rows == 0)
    {
        echo "No hay coicidencias";
    }
    else
    {
        $output ='<div class="btn-group-vertical" data-toggle="buttons">';
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result); 
            $output .= '<label title = "'.$row['descripcion'].'" onclick= "updateText(this);" id ="'.$row['nombre'].'" class = "btn btn-warning ss-s">';
            $output.='<input type="radio" class="hide" name="platillo" value="'.$row['clave'].'" required checked>'.$row['nombre'].'<br>';
            $output .= '</label>';
        }
        $output .= '</div';
        echo $output;
    }
    mysqli_close($connection);
?> 