<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('{"error":1}');

    $query = "SELECT * from ingrediente"; 

    $result = mysqli_query($connection, $query) or die ('{"error":2}');

    $nfilas = mysqli_num_rows($result);


    if($nfilas > 0)
    {
        echo "[";
        for($i = 0; $i<$nfilas; $i++)
        {
            $row = mysqli_fetch_array($result); 
            echo '{';
            $nombre = $row['nombre'];
            $existencia = $row['cantidad'];
            $critica = $row['existencia_critica'];
            $especificacion = $row['especificacion'];
            echo '"nombre" : "'.$nombre.'",';
            echo '"existencia": "'.$existencia.'",';
            echo '"critica" : "'.$critica.'",';
            echo '"especificacion": "'.$especificacion.'"';
            echo '}';
            if($i!=$nfilas-1)
            {
                echo ',';
            }
        }
        echo "]";
    }
    else 
    {
        echo '{"error":4}';
    }
?>