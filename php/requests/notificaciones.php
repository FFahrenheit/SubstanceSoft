<?php 
    session_start();
    header('Content-Type: text/html; charset=utf-8');
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("connection");
    mysqli_set_charset($connection,"utf8");
    freeQuery();
    $user = $_SESSION['username'];
    $query = "CALL obtenerMensajes('$user')";
    $result = mysqli_query($connection,$query) or die("query");
    if($result)
    {
        $out = array();
        while($row = mysqli_fetch_array($result,MYSQLI_ASSOC))
        {
            $out[] = $row;
        }
        echo json_encode($out,JSON_UNESCAPED_UNICODE);
        return json_encode($out);
    }
    else
    {
        echo 'void';
        freeQuery();
        mysqli_close($connection);
        return "void";
    }

    function freeQuery()
    {
        $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');
        do 
        {
            if ($res = $connection->store_result()) {
              $res->free();
            }
        } while ($connection->more_results() && $connection->next_result()); 
    }
?>