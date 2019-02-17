<?php
    $nom = $_POST['nom'];
    $pas = $_POST['pas'];
    $usu = $_POST['usu'];
    $pat = $_POST['pat'];
    $mat = $_POST['mat'];
    $dir = $_POST['dir'];
    $tel = $_POST['tel'];

    if($tel=="")
    {
        $tel = 0;
    }

    $conexion = mysqli_connect("localhost", "root", "", "substancesoft") or die("xd");

    $query = "INSERT INTO usuario (username, password, nombre, apellido_p, apellido_m, 
    telefono, direccion, tipo) VALUES ('$usu', '$pas', '$nom', '$pat', '$mat', $tel, '$dir', 'administrador')";

    $result = mysqli_query($conexion, $query);

    echo json_encode($query);

    mysqli_close($connection);
?>
