<?php 
    $user = $_POST['user'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');

    $query = "SELECT tarjeta FROM usuario WHERE username = '$user'";

    $result = mysqli_query($connection,$query) or die('"Error, no se pudo asignar esta tarjeta"');

    if($row = mysqli_fetch_array($result))
    {
        switch($row['tarjeta'])
        {
            case "0":
                echo json_encode("no");
                break;
            case "":
                echo json_encode("Se ha comenzado el registro de otro usuario, intente de nuevo");
                break;
            default:
                echo json_encode("ok");
                break;
        }
    }
    else 
    {
        echo json_encode("No se encontro al usuario");
    }

    mysqli_close($connection);
?>