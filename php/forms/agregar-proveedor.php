<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

    $nom = $_POST['nom'];

    $query = "INSERT INTO proveedor (nombre) VALUES ('$nom')";

    $result = mysqli_query($connection, $query);

    $query = "SELECT * FROM proveedor WHERE nombre = '$nom'";

    $select = mysqli_query($connection, $query);

    $row = mysqli_fetch_array($select);

    echo json_encode($row);

    mysqli_close($connection);
?>
