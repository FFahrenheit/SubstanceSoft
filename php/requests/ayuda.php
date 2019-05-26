<?php 
    $cocina = $_POST['cocina'];
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");
    $query = "CALL hombrePlatillo()";
    freeQuery();
    $result = mysqli_query($connection,$query);
    $found = false;
    $out = "<p>No se han encontrado posibles cocinas</p>";
    while($row = mysqli_fetch_array($result))
    {
        if($found)
        {
            $out .= '<button value="'.$row['clave'].'" onclick="help(this)" class="btn btn-primary">Pedir ayuda a 
            cocina '.$row['cocina'].'</button><br></br>';
        }
        if($row['clave'] == $cocina)
        {
            $found = true;
            $out = "";
        }
    }
    if($out=="")
    {
        echo "<p>No hay cocinas disponibles para responder a su solicitud de ayuda</p>";
    }
    else 
    {
        echo $out;
    }

    mysqli_close($connection);

    
    function freeQuery()
    {
        global $connection;
        do 
        {
            if ($res = $connection->store_result()) {
              $res->free();
            }
        } while ($connection->more_results() && $connection->next_result()); 
    }
?>