<?php
    session_start();
    $description = $_POST['desc'];
    $mesa = $_POST['mesa'];
    $user = $_SESSION['username'];
    $clientes = (isset($_POST['clientes'])) ? $_POST['clientes'] : 1;

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "INSERT INTO orden(mesa, usuario, descripcion,estado,clientes) VALUES 
    ($mesa, '$user','$description','abierta', $clientes)";

    $result = mysqli_query($connection, $query) or die ('"Error al agregar"');

    if(isset($_POST['drive']) && $_POST['drive']==1)
    {
        echo json_encode(mysqli_insert_id($connection));
    }
    else 
    {
        echo json_encode("Exito");
    }

    mysqli_close($connection);
?>