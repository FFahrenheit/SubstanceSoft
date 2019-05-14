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
            if(isPossible($row['clave']))
            {
                $output .= '<label title = "'.$row['descripcion'].'" onclick= "updateText(this);" id ="'.$row['nombre'].'" class = "btn btn-warning ss-s">';
                $output.='<input type="radio" class="hide" name="platillo" value="'.$row['clave'].'" required checked>'.$row['nombre'].'<br>';
                $output .= '</label>';
            }
            else 
            {
                $output .= '<label title = "'.$row['descripcion'].'" onclick= "alert('."'Platillo inhabilitado'".')" id ="'.$row['nombre'].'" class = "btn btn-secondary">';
                $output.='<input type="radio" class="hide" name="platillo" value="'.$row['clave'].'" required checked>'.$row['nombre'].' (no disponible)<br>';
                $output .= '</label>';
            }
        }
        $output .= '</div';
        echo $output;
    }
    mysqli_close($connection);


    function isPossible($clave)
    {
        $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');
        freeQuery($connection);
        $req = "CALL obtenerIngredientes($clave)";
        $result = mysqli_query($connection,$req) or die('"Error en llamada"');
        $isPossible = true;
        if($result->num_rows>0)
        {
            for($j = 0; $j<$result->num_rows; $j++)
            {
                $row = mysqli_fetch_array($result);
                if($row['necesario'] > $row['existencia'])
                {
                    return false;
                }
            }
        }
        return $isPossible;
    }


    function freeQuery($connection)
    {
        do 
        {
            if ($res = $connection->store_result()) {
              $res->free();
            }
        } while ($connection->more_results() && $connection->next_result()); 
    }
?> 