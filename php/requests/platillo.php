<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    if(isset($_POST['consulta']))
    {
        $search = $_POST['consulta'];
        $query = "select * from platillo where nombre like '%$search%' or descripcion like '%$search%'";
    }
    else
    {
        $query = "select * from platillo";
    }

    $result = mysqli_query($connection, $query) or die ("Error en query");

    if($result->num_rows == 0)
    {
        echo "No hay coicidencias";
    }
    else
    {
        $output ="";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result); 
            $output.='<input type=radio name="platillo" value="'.$row['clave'].'" required checked>'.$row['nombre'].'<br>';
        }
        echo $output;
    }
    mysqli_close($connection);
?>