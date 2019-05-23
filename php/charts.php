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
            $output .= "'".$row['nombre']." (".$row['cocina'].")'";
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

    function getDailyClients()
    {
        global $connection;
        $query = "SELECT * FROM ventas_dia";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            $output .= $row['clientes'];
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
    function getDailyAverage()
    {
        global $connection;
        $query = "SELECT * FROM ventas_dia";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            ($row['media']=="") ? $output .= "0" : $output.= $row['media'];
            if($i != $result->num_rows - 1)
            {
                $output.=",";
            }
        }
        return $output;   
    }
    function getDailyDensity()
    {
        global $connection;
        $query = "SELECT * FROM ventas_dia";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            ($row['densidad']=="") ? $output .= "0" : $output.= $row['densidad'];
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

    function getIngredientUse()
    {
        global $connection;
        $query = "SELECT * FROM uso_ingredientes";
        $array = getIngredientTitlesForUse();
        $output = "";
        for($i = 0; $i < sizeof($array); $i++)
        {
            $result = mysqli_query($connection,$query);
            $found = false;
            for($j=0; $j<$result->num_rows;$j++)
            {
                $row = mysqli_fetch_array($result);
                if($row['nombre'] == $array[$i])
                {
                    $output .= "'".$row['suma']."',";
                    $found = true;
                    break;
                }
            }
            if(!$found)
            {
                $output .= "'0',";
            }
        }
        $output = trim($output,",");
        return $output;
    }

    function getIngredientSupply()
    {
        global $connection;
        $query = "SELECT * FROM surtido_ingredientes";
        $array = getIngredientTitlesForUse();
        $output = "";
        for($i = 0; $i < sizeof($array); $i++)
        {
            $result = mysqli_query($connection,$query);
            $found = false;
            for($j=0; $j<$result->num_rows;$j++)
            {
                $row = mysqli_fetch_array($result);
                if($row['nombre'] == $array[$i])
                {
                    $output .= "'".$row['suma']."',";
                    $found = true;
                    break;
                }
            }
            if(!$found)
            {
                $output .= "'0',";
            }
        }
        $output = trim($output,",");
        return $output;
    }

    function getIngredientTitles()
    {
        global $connection;
        $query = "SELECT * FROM titulos_ingredientes";
        $result = mysqli_query($connection,$query);
        $output = "";
        for($i=0; $i<$result->num_rows; $i++)
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

    function getIngredientTitlesForUse()
    {
        global $connection;
        $query = "SELECT * FROM titulos_ingredientes_2";
        $result = mysqli_query($connection,$query);
        $array = array();
        for($i=0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            $array[$i] = $row['nombre'];
        } 
        return $array;
    }

    function getEntryTitle($user)
    {
        global $connection;
        $query = "SELECT date(entrada) AS dia, TIME_TO_SEC(time(entrada)) as entrada, TIME_TO_SEC(time(salida)) as salida 
        FROM asistencia WHERE usuario = '$user' AND 
        entrada >= (SELECT valor from fechas where nombre='fecha_in') 
        AND entrada <= (SELECT valor from fechas where nombre='fecha_fin') ";
        $result = mysqli_query($connection,$query);
        $array = "";
        for($i=0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            $array .= "'".$row['dia']."'";
            if($i != $result->num_rows - 1)
            {
                $array.=",";
            }   
        }
        return $array;
    }

    function getEntryData($user)
    {
        global $connection;
        $query = "SELECT date(entrada) AS dia, TIME_TO_SEC(time(entrada)) as entrada, TIME_TO_SEC(time(salida)) as salida 
        FROM asistencia WHERE usuario = '$user' AND 
        entrada >= (SELECT valor from fechas where nombre='fecha_in') 
        AND entrada <= (SELECT valor from fechas where nombre='fecha_fin') ";
        $result = mysqli_query($connection,$query);
        $array = "";
        for($i=0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            $array .= $row['entrada'];
            if($i != $result->num_rows - 1)
            {
                $array.=",";
            }   
        }
        return $array;
    }

    function getExitData($user)
    {
        global $connection;
        $query = "SELECT date(entrada) AS dia, TIME_TO_SEC(time(entrada)) as entrada, TIME_TO_SEC(time(salida)) as salida 
        FROM asistencia WHERE usuario = '$user' AND 
        entrada >= (SELECT valor from fechas where nombre='fecha_in') 
        AND entrada <= (SELECT valor from fechas where nombre='fecha_fin') ";
        $result = mysqli_query($connection,$query);
        $array = "";
        for($i=0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            $array .= $row['salida'];
            if($i != $result->num_rows - 1)
            {
                $array.=",";
            }   
        }
        return $array;
    }
?>