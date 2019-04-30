<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se pudo conectar a la BD"');

    $nombre = $_POST['nombre'];
    $precio = $_POST['precio'];
    $cocina = $_POST['cocina'];
    $descripcion = $_POST['descripcion'];
    $dif = $_POST['dif'];
    $cat = $_POST['categoria'];
    if(!isset( $_FILES['imagen']['tmp_name']) && $_FILES['imagen']['tmp_name']!='')
    {
        $file = addslashes(file_POST_contents($_FILES['imagen']['tmp_name']));
    }
    else
    {
        $file="";
    }

    $old = $_POST['old'];

    $query = "SELECT clave from cocina where nombre='$cocina'";

    $result = mysqli_query($connection, $query) or die ('"Error en cocina"');
    $row = mysqli_fetch_array($result);
    $kitchen_id = $row['clave'];

    $query = "UPDATE platillo SET nombre = '$nombre', precio = $precio, dificultad = '$dif', descripcion = '$descripcion',
    imagen = '$file', cocina = $kitchen_id, categoria = '$cat' WHERE clave =$old";

    $result = mysqli_query($connection, $query) or die ('"Campos invalidos"');

    echo json_encode("Platillo modificado. Regresando...");

    mysqli_close($connection);

?>
