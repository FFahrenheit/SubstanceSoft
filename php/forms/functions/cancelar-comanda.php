<?php
    $user = $_POST['user'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha conectar"');

    freeQuery();

    $query = "select orden from pedidos where clave=$user" or die('"Error en clave orden"');

    $result = mysqli_query($connection,$query);

    $row = mysqli_fetch_array($result);

    $clave = $row['orden'];

    $query = "delete from pedidos where clave=$user";

    $result = mysqli_query($connection, $query) or die('"Error al eliminar"');

    $query = "update orden set total = (select sum(platillo.precio) from platillo, (select * from orden) as ord, 
    pedidos where platillo.clave= pedidos.platillo and ord.clave = $clave and 
    ord.clave=pedidos.orden) 
    where clave = $clave";

    $result = mysqli_query($connection, $query) or die ('"Error en query 2"');

    echo json_encode("Exito!");

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