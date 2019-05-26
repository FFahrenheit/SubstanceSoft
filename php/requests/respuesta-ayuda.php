<?php 
    $status = $_POST['status'];
    $key = $_POST['key'];
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("error en BD");

    $new = ($status == 'true') ? "'aceptado'" : "'rechazado'";

    $query = "UPDATE ayuda SET estado = $new WHERE clave = $key" or die("No se pudo responder a la solicitud");

    mysqli_query($connection,$query);

    echo "Éxito";

    mysqli_close($connection);
?>