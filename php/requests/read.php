<?php
    $code = $_GET['code'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("0");
    /*
    HTTP request for read on Arduino module
    and insert into database.
    -0 equals error.
    -1 equals success
    */

    $query = "SELECT clave FROM asistencia WHERE usuario = 
    (SELECT username FROM usuario WHERE tarjeta = $code) AND 
    salida IS NULL";
    
    $result = mysqli_query($connection, $query) or die("0");
    $row = mysqli_fetch_array($result);
    
    if(isset($row['clave'])) //Si es salida 
    {
        $query = "UPDATE asistencia SET salida = NOW() WHERE clave = ".$row['clave'];
        $result = mysqli_query($connection,$query);
    }
    else //Es entrada
    {
        $query = "INSERT INTO asistencia(usuario) VALUES (
            (SELECT username FROM usuario WHERE tarjeta = $code))";
        $result = mysqli_query($connection,$query) or die("0");
    }

    echo "1";
    mysqli_close($connection);
?>