<?php
    $qty = $_POST['qty'];
    $platillo = $_POST['platillo'];
    $ing = $_POST['ing'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "insert into recetas(cantidad, ingrediente, platillo) values ($qty, $ing, $platillo)";

    $result = mysqli_query($connection, $query) or die ('"Error al agregar"');

    echo json_encode("Ingrediente arreglado");

?>