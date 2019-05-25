<?php 
    $clave = $_POST['clave'];
    $total = $_POST['total'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "CALL actualizarTotal($clave)";
    
    $result = mysqli_query($connection,$query);

    freeQuery();

    $query = "UPDATE orden SET total = total*(1 - ($total/100)) WHERE clave = $clave";

    $result = mysqli_query($connection, $query) or die ('"Error al modificar"');

    freeQuery();

    echo json_encode("Exito");

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