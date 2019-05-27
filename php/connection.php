<?php  //En esta clase se maneja la conexión a la base de datos de una forma extraña jaja
    function getConnection()
    {
        $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
        $query = "SELECT valor FROM preferencias WHERE nombre='aplicacion_movil'";
        $result = mysqli_query($connection,$query);
        $row = mysqli_fetch_assoc($result);
        if($row['valor'] == 0)
        {
            return $connection;
        }
        else 
        {
            $query = "SELECT ip FROM equipos WHERE alias = 'remote'";
            $result = mysqli_query($connection,$query);
            $row = mysqli_fetch_assoc($result);
            $newConnection = mysqli_connect($row['ip'],"remote","1234","substancesoft");
            return $newConnection;
        }
    }

?>