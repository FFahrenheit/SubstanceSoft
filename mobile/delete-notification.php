<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('{"error":1}');
    $id = $_GET['id'];
    $query = "DELETE FROM notificaciones WHERE clave = $id";
    $result = mysqli_query($connection, $query) or die ('{"error":2}');
    mysqli_close($connection);
    echo ('{"error":0}');
?>
