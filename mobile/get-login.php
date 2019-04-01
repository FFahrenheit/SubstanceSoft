<?php
    $user = $_GET['user'];
    $pass = $_GET['pass'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('{"error":1}');

    $query = "SELECT password, nombre 'x', apellido_p 'y', apellido_m 'z', tipo from usuario where username='$user'"; 

    $result = mysqli_query($connection, $query) or die ('{"error":2}'); 

    if($result->num_rows > 0)
    {
        $row = mysqli_fetch_array($result); 
        $nombre = $row['x']." ".$row['y']." ".$row['z'];
        if($row['password']==$pass && $row['tipo']=='administrador')
        {
            echo '{"error":0,';
            echo '"nombre": "'.$nombre.'"}';
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