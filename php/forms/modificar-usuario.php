<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se pudo conectar a la BD"');

    $nom = $_POST['nom'];
    $pas = $_POST['pas'];
    $usu = $_POST['usu'];
    $pat = $_POST['pat'];
    $mat = $_POST['mat'];
    $dir = $_POST['dir'];
    $tel = $_POST['tel'];
    $old = $_POST['old'];

    if($tel=="")
    {
        $tel=0;
    }

    $query = "UPDATE usuario SET username='$usu', password='$pas', nombre='$nom', apellido_p='$pat', apellido_m='$mat',
    telefono=$tel, direccion='$dir' WHERE username ='$old'";

    $result = mysqli_query($connection, $query) or die (' "Usuario repetido o campos invalidos. Reintente"');

    echo json_encode("Usuario modificado. Regresando...");

    mysqli_close($connection);

?>