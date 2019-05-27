<?php
    $user = $_GET['user'];
    $pass = $_GET['pass'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('{"error":1}');

    $query = "SELECT AES_DECRYPT(password,'Sub5t4nc3S0Ft') AS pass, nombre 'x', apellido_p 'y', apellido_m 'z', username, tipo from usuario where username='$user'";

    $result = mysqli_query($connection, $query) or die ('{"error":2}');

    if($result->num_rows > 0)
    {
        $row = mysqli_fetch_array($result);
        $nombre = $row['x']." ".$row['y']." ".$row['z'];
        $user = $row['username'];
        if($row['pass']==$pass && $row['tipo']=='admin')
        {
            echo '{"error":0,';
            echo '"nombre":"'.$nombre.'","pass":"'.$row['pass'].'",';
            echo '"user:":"'.$user.'",';
            $query = "SELECT * FROM preferencias WHERE nombre = 'aplicacion_movil'";
            $result = mysqli_query($connection,$query);
            $row=mysqli_fetch_array($result);
            echo '"valor":"'.$row['valor'].'"}';
        }
        else
        {
            echo '{"error":4}';
        }
    }
    else
    {
        '{"error":3}';
    }
    mysqli_close($connection);
?>
