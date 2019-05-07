<?php
    $clave = $_POST['clave'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha conectar"');

    $query = "SELECT nombre_trigger AS nombre FROM surtidos WHERE proveedor = $clave";

    $result = mysqli_query($connection, $query) or die("'No hay triggers'");

    $triggers = array();

    $rows = $result->num_rows;

    for($i = 0; $i< $rows; $i++)
    {
        $row = mysqli_fetch_array($result);
        $triggers[$i] = $row['nombre'];
    }

    for($i = 0; $i < $rows; $i++)
    {
        $query = "DROP EVENT ".$triggers[$i];
        $result = mysqli_query($connection,$query) or die("'No se pudo eliminar'");
    }

    $query = "DELETE FROM proveedor WHERE clave = '$clave'";

    $result = mysqli_query($connection, $query) or die('"Proveedor invalido"');

    echo json_encode("Exito!");

    mysqli_close($connection);
?>
