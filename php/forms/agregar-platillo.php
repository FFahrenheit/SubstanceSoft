<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $name = $_POST['name'];
    $price = $_POST['price'];
    $kitchen = $_POST['kitchen'];
    $description = $_POST['description'];
    $dif = $_POST['dif'];
    $cat = $_POST['cat'];
    if($_FILES['image']['tmp_name']!='')
    {
        $file = addslashes(file_get_contents($_FILES['image']['tmp_name']));
    }
    else 
    {
        $file="";
    }

    $query = "SELECT clave from cocina where nombre='$kitchen'";
    $result = mysqli_query($connection, $query) or die ('"Error en cocina"');
    $row = mysqli_fetch_array($result);
    $kitchen_id = $row['clave'];

    $query = "INSERT INTO platillo (nombre, precio, dificultad, descripcion, cocina,categoria,imagen) 
    VALUES ('$name', $price, '$dif', '$description', $kitchen_id, '$cat','$file')";

    $result = mysqli_query($connection, $query) or die('"Error en query"');

    $id = mysqli_insert_id($connection);
    echo json_encode($id);

    mysqli_close($connection);
?>