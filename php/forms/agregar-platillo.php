<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $name = $_POST['name'];
    $price = $_POST['price'];
    $kitchen = $_POST['kitchen'];
    $description = $_POST['description'];
    $dif = $_POST['dif'];
    $cat = $_POST['cat'];

    $query = "SELECT clave from cocina where nombre='$kitchen'";
    $result = mysqli_query($connection, $query) or die ('"Error en cocina"');
    $row = mysqli_fetch_array($result);
    $kitchen_id = $row['clave'];

    $query = "INSERT INTO platillo (nombre, precio, dificultad, descripcion, cocina,categoria) 
    VALUES ('$name', $price, '$dif', '$description', $kitchen_id, '$cat')";

    $result = mysqli_query($connection, $query) or die('"Error en query"');

    echo json_encode("Exito!");

    mysqli_close($connection);
?>