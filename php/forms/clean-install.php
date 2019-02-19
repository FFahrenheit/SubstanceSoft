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

    $conexion = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se pudo conectar a la base de datos"');

    $query = "INSERT INTO usuario (username, password, nombre, apellido_p, apellido_m,
    telefono, direccion, tipo) VALUES ('$usu', '$pas', '$nom', '$pat', '$mat', $tel, '$dir', 'administrador')";

    $result = mysqli_query($conexion, $query) or die('"El nombre de usuario ya existe"');

    echo '"Exito!"';

    mysqli_close($conexion);
?>
