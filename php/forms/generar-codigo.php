<?php
    $user = $_POST['user'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha conectar"');

    $query = "UPDATE usuario SET codigo = (Select Cast(rand()*10000 as int)) WHERE username='$user'";

    $result = mysqli_query($connection, $query) or die('"Usuario invalido"');

    echo json_encode("Exito!");

    mysqli_close($connection);
?>
