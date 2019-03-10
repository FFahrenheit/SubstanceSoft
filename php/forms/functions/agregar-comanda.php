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

    echo json_encode("Exito!");

    mysqli_close($connection);
?>