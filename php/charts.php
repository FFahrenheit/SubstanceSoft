<?php 
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');

    function getSalesPerHourTitles()
    {
        global $connection;
        $query = "SELECT * FROM horarios";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            $output .= "'".$row['nombre']."'";
            if($i != $result->num_rows - 1)
            {
                $output.=",";
            }
        }
        return $output;
    }

    function getSalesPerHourData()
    {   
        global $connection;
        $query = "SELECT * FROM horarios";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            ($row['venta']=="") ? $output .= "0" : $output.= $row['venta'];
            if($i != $result->num_rows - 1)
            {
                $output.=",";
            }
        }
        return $output;
    }

    function getPopularDishesTitles()
    {
        global $connection;
        $query = "SELECT * FROM platillos_populares";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            $output .= "'".$row['nombre']."'";
            if($i != $result->num_rows - 1)
            {
                $output.=",";
            }
        }
        return $output;
    }

    function getPopularDishesData()
    {
        global $connection;
        $query = "SELECT * FROM platillos_populares";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            ($row['suma']=="") ? $output .= "0" : $output.= $row['suma'];
            if($i != $result->num_rows - 1)
            {
                $output.=",";
            }
        }
        return $output;
    }

    function getDailyEarningTitles()
    {
        global $connection;
        $query = "SELECT * FROM ventas_dia";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            $output .= "'".$row['dia']."'";
            if($i != $result->num_rows - 1)
            {
                $output.=",";
            }
        }
        return $output;
    }

    function getDailyEarningData()
    {
        global $connection;
        $query = "SELECT * FROM ventas_dia";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            ($row['suma']=="") ? $output .= "0" : $output.= $row['suma'];
            if($i != $result->num_rows - 1)
            {
                $output.=",";
            }
        }
        return $output;   
    }

    function getParticipationTitles()
    {
        global $connection;
        $query = "SELECT * FROM usuario_ordenes";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            $output .= "'".$row['usuario']."'";
            if($i != $result->num_rows - 1)
            {
                $output.=",";
            }
        }
        return $output;   
    }

    function getParticipationOrdersData()
    {
        global $connection;
        $query = "SELECT * FROM usuario_ordenes";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            ($row['suma']=="") ? $output .= "0" : $output.= $row['suma'];
            if($i != $result->num_rows - 1)
            {
                $output.=",";
            }
        }
        return $output;   
    }

    function getParticipationRequestsData()
    {
        global $connection;
        $query = "SELECT COUNT(tab.usuario) as 'suma', tab.usuario FROM
        (select pedidos.hora as 'hora', usuario from pedidos, orden where orden.clave = pedidos.orden)
        AS tab
        WHERE tab.hora >= (SELECT valor from fechas where nombre='fecha_in') 
        AND tab.hora <= (SELECT valor from fechas where nombre='fecha_fin') 
        GROUP BY tab.usuario
        ORDER BY tab.usuario";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            ($row['suma']=="") ? $output .= "0" : $output.= $row['suma'];
            if($i != $result->num_rows - 1)
            {
                $output.=",";
            }
        }
        return $output;  
    }
?>