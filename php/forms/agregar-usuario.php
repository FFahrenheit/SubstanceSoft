<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

    $nom = $_POST['nom'];
    $pas = $_POST['pas'];
    $usu = $_POST['usu'];
    $pat = $_POST['pat'];
    $mat = $_POST['mat'];
    $dir = $_POST['dir'];
    $tel = $_POST['tel'];
    $tip = $_POST['tip'];

    if($tel=="")
    {
        $tel=0;
    }

    $query = "INSERT INTO usuario (username, password, nombre, apellido_p, apellido_m,
    telefono, direccion, tipo) VALUES ('$usu', '$pas', '$nom', '$pat', '$mat', $tel, '$dir', '$tip')";

    $result = mysqli_query($connection, $query);

    echo json_encode("Exito!");

    mysqli_close($connection);
?>