<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('{"error":1}');

    $query = "SELECT valor from preferencias where nombre='aplicacion_movil'";

    $result = mysqli_query($connection, $query) or die ('{"error":2}');

    $row = mysqli_fetch_array($result);

    echo json_encode($row);
    mysqli_close($connection);
?>
