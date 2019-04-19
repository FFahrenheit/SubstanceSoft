<?php
    $user = $_POST['user'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha conectar"');

    $query = "UPDATE usuario SET codigo = 
    (SELECT CAST(RAND()*10000 AS INT) FROM (SELECT * FROM usuario) AS usrs
    WHERE CAST(RAND()*10000 as INT) NOT IN 
    (SELECT codigo FROM (SELECT * FROM usuario) AS usrs1) limit 1) WHERE username='$user'";

    $result = mysqli_query($connection, $query) or die('"Usuario invalido"');

    echo json_encode("Exito!");

    mysqli_close($connection);
?>
