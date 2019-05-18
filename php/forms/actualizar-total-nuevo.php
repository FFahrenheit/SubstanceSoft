<?php 
    $clave = $_POST['clave'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "CALL actualizarTotal($clave)";

    freeQuery();

    $result = mysqli_query($connection, $query) or die ('"Error al calcular"');

    echo json_encode("Recalculado");

    freeQuery();
    
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