<?php
    $code = $_GET['code'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("0");
    /*
    HTTP request for read on Arduino module
    and insert into database.
    -0 equals error.
    -1 equals success
    */

    $query = "SELECT username FROM usuario WHERE tarjeta = $code";
    $result = mysqli_query($connection,$query) or die("0");
    if($row  = mysqli_fetch_array($result))  //Si la tarjeta está registrada
    {
        $user = $row['username'];

        $query = "UPDATE usuario SET tarjeta = NULL WHERE tarjeta = 0";
        mysqli_query($connection,$query) or die("0");   //Borramos los usuario esperando tarjeta

        $query = "SELECT clave FROM asistencia WHERE usuario = 
        '$user' AND salida IS NULL";
        
        $result = mysqli_query($connection, $query) or die("0");
        $row = mysqli_fetch_array($result);
        
        if(isset($row['clave'])) //Si es salida 
        {
            $salida = true;
            $query = "UPDATE asistencia SET salida = NOW() WHERE clave = ".$row['clave'];
            $result = mysqli_query($connection,$query) or die("0");
        }
        else //Es entrada
        {
            $salida = false;
            $query = "INSERT INTO asistencia(usuario) VALUES (
                (SELECT username FROM usuario WHERE tarjeta = $code))";
            $result = mysqli_query($connection,$query) or die("0");
        }

        $query = "SELECT username FROM usuario WHERE tarjeta = $code";
        $result = mysqli_query($connection, $query) or die("0");
        $row = mysqli_fetch_array($result);

        $tipo = $salida ? "<1" : "<0";
        echo $row['username'].$tipo;
    }
    else 
    {
        $query = "SELECT username FROM usuario WHERE tarjeta = 0 LIMIT 1";
        $result = mysqli_query($connection,$query) or die("0");

        if($row = mysqli_fetch_array($result))
        {
            $user = $row['username'];
            $query = "UPDATE usuario SET tarjeta = $code WHERE username = '$user'";
            mysqli_query($connection,$query) or die("0");
            echo "2";
        }
        else 
        {
            echo "3";         //No hay ninguna tarjeta esperando
        }
    }
    mysqli_close($connection);
?>