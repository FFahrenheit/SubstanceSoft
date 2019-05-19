<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"conexion"');
    
    $qty = $_POST['qty'];
    $nombre_platillo  = $_POST['platillo'];

    $clave = $_POST['clave'];

    $query = "SELECT valor FROM preferencias WHERE nombre = 'notificacion_chef'";
    $result = mysqli_query($connection,$query) or die("'Error en modo de notificación'");

    $row = mysqli_fetch_array($result);

    $type = $row['valor'];

    for($i = 0; $i<$qty ;$i++)
    {
        freeQuery();
        freeQuery();
        $req = "CALL obtenerIngredientes((SELECT clave FROM platillo WHERE nombre = '$nombre_platillo'))";
        $result = mysqli_query($connection,$req) or die('"Error en llamada"');
        $isPossible = true;
        if($result->num_rows>0)
        {
            for($j = 0; $j<$result->num_rows; $j++)
            {
                $row = mysqli_fetch_array($result);
                if(($i+1)*$row['necesario'] > $row['existencia'])
                {
                    $isPossible = false;
                    break;
                }
            }
        }
        if($isPossible)
        {
            freeQuery();
            $query = "INSERT INTO pedidos(platillo, orden, estado) values (
                (SELECT clave FROM platillo WHERE nombre = '$nombre_platillo')
                , $clave, 'pedido')";
            $result = mysqli_query($connection, $query) or die ('"query"');
            if($type==1)
            {
                $id = mysqli_insert_id($connection);
                $query = "UPDATE pedidos SET estado = 'listo' WHERE clave = $id";
                $result = mysqli_query($connection,$query) or die ('"Error en modo de notificación"');
            }
        }
        else 
        {
            $last = $i;
            break;
        }
    }



    //Liberar consultas incompletas.
    freeQuery();

    
    $query = "CALL actualizarTotal($clave)";

    $result = mysqli_query($connection, $query) or die (mysqli_error($connection));

    if(!$isPossible)
    {
        echo json_encode("Error, falta de ingredientes en inventario. Solo se han agregado ".$last." platillo(s)");
    }
    else
    {
        echo json_encode("exito");
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