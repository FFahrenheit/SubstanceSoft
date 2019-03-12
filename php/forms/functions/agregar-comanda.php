<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');
    
    $qty = $_POST['qty'];
    $platillo  = $_POST['platillo'];
    $clave = $_POST['clave'];

    $query = "insert into pedidos(platillo, orden, estado) values ($platillo, $clave, 'pedido')";

    for($i = 0; $i<$qty ;$i++)
    {
        $result = mysqli_query($connection, $query) or die ('"Error en query"');
    }

    $query = "update orden set total = (select sum(platillo.precio) from platillo, (select * from orden) as ord, 
    pedidos where platillo.clave= pedidos.platillo and ord.clave = $clave and 
    ord.clave=pedidos.orden) 
    where clave = $clave";

    $result = mysqli_query($connection, $query) or die ('"Error en query 2"');


    echo json_encode("Exito!");

    mysqli_close($connection);
?>