<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $numero = $_POST['numero'];

    $query = "SELECT * FROM mesa WHERE numero = '$numero'";

    $result = mysqli_query($connection, $query) or die('"Error en query"');

    if($result->num_rows > 0)
    {
      echo json_encode("nel");
    }
    else
    {
      echo json_encode("ok");
    }

    mysqli_close($connection);
?>
