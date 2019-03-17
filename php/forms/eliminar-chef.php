<?php
    $user = $_POST['user'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha conectar"');

    $query = "DELETE FROM chefs WHERE clave=$user";

    $result = mysqli_query($connection, $query) or die('"Query"');

    echo json_encode("Exito!");

    mysqli_close($connection);
?>