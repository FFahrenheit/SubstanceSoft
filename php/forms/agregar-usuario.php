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
    if($tip == 'administrador')
    {
        $query = "SELECT COUNT(*) as conteo FROM usuario WHERE tipo = 'administrador'";
        $result = mysqli_query($connection,$query);
        $row = mysqli_fetch_assoc($result);
        {
            if($row['conteo']>=5)
            {
                echo "'Error, solo pueden haber 5 administradores'";
                mysqli_close($connection);
                die();
            }
        }
    }

    $query = "INSERT INTO usuario (username, password, nombre, apellido_p, apellido_m,
    telefono, direccion, tipo) VALUES ('$usu', '$pas', '$nom', '$pat', '$mat', $tel, '$dir', '$tip')";

    $result = mysqli_query($connection, $query) or die("'Error al ingresar, datos inválidos'");

    echo json_encode("Exito!");

    mysqli_close($connection);
?>