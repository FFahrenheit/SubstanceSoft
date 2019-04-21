<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"conexion"');
    
    $qty = $_POST['qty'];
    $platillo  = $_POST['platillo'];
    $clave = $_POST['clave'];

    for($i = 0; $i<$qty ;$i++)
    {
        freeQuery();
        $req = "CALL obtenerIngredientes($platillo)";
        $result = mysqli_query($connection,$req) or die('"Error en llamada"');
        $isPossible = true;
        if($result->num_rows>0)
        {
            for($j = 0; $j<$result->num_rows; $j++)
            {
                $row = mysqli_fetch_array($result);
                if($row['necesario'] > $row['existencia'])
                {
                    $isPossible = false;
                    break;
                }
            }
        }
        if($isPossible)
        {
            freeQuery();
            $query = "insert into pedidos(platillo, orden, estado) values ($platillo, $clave, 'pedido')";
            $result = mysqli_query($connection, $query) or die ('"query"');
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