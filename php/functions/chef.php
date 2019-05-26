<?php 
    $user = $_SESSION['username'];
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
    mysqli_set_charset($connection,"utf-8");

    function getAvailableKitchens()
    {
        global $user, $connection;

        if($_SESSION['tipo']=='administrador' || $_SESSION['tipo']=='admin')
        {
            $query = "select nombre, clave as pk from cocina";
        }
        else
        {
            $query = "select cocina.nombre as nombre, chefs.cocina as pk from chefs, cocina where
            chefs.usuario = '$user' and cocina.clave = chefs.cocina";
        }

        $result = mysqli_query($connection, $query) or die ('"query"');
        $output = "";
        if($result->num_rows!=0)
        {
            for($i=0; $i<$result->num_rows; $i++)
            {
                $row = mysqli_fetch_array($result);
                if($i%3 == 0)
                {
                    $output .= '<div class="card-deck">';
                }
                $output.= '<a href="../functions/forms/visualizar.php?clave='.$row['pk'].'" class="a-card">';
                $output.='<div style class="card text-center">';
                $output.='<div class="card-body">';
                $output.='<img class="card-img-top img-fluid" src="../../images/cocinas.png" alt="Cocina">';
                $output.='<div class="card-block">';
                $output.='<h4 class="card-title">Cocina: '.$row['nombre'].'</h4>';
                $output.='<p class="card-text"></p>';
                $output.='<p><a href="../functions/forms/visualizar.php?clave='.$row['pk'].'" class="btn btn-primary">Ver y notificar</a></p>';
                $output.='</div></div></div></a>';
                if(($i+1)%3==0)
                {
                    $output.="</div>";
                }
            }
            $rest = 3- $result->num_rows%3;
            if($rest == 3)
            {
                $output.='<div class="card-deck">';
            }
                for($i=0; $i<$rest; $i++)
                {
                    $output.='<div class="card text-center" style="visibility: hidden"> <div class="card-body"></div></div>';
                }
            /*for($i=0; $i<$rest; $i++)
            {
                $output.='<div class="card text-center" style="visibility: hidden"> <div class="card-body"></div></div>';
            }*/
            if($rest>0)
            {
                $output.="</div>";
            }
        }
        return $output;
    }

    function getKitchens()
    {
        global $user, $connection;
        if($_SESSION['tipo']=='administrador'|| $_SESSION['tipo']=='admin')
        {
            $query = "select nombre, clave as pk from cocina";
        }
        else
        {
            $query = "select cocina.nombre as nombre, chefs.cocina as pk from chefs, cocina where
            chefs.usuario = '$user' and cocina.clave = chefs.cocina";
        }
        $result = mysqli_query($connection, $query) or die ('"query"');
        $output = "";
        if($result->num_rows!=0)
        {
            for($i=0; $i<$result->num_rows; $i++)
            {
                $row = mysqli_fetch_array($result);
                if($i%3 == 0)
                {
                    $output .= '<div class="card-deck">';
                }
                $output.= '<a href="../functions/forms/ver.php?clave='.$row['pk'].'" class="a-card">';
                $output.='<div class="card text-center">';
                $output.='<div class="card-body">';
                $output.='<img class="card-img-top img-fluid" src="../../images/cocinas.png" alt="Cocina">';
                $output.='<div class="card-block">';
                $output.='<h4 class="card-title">Cocina: '.$row['nombre'].'</h4>';
                $output.='<p class="card-text"></p>';
                $output.='<p><a href="../functions/forms/ver.php?clave='.$row['pk'].'" class="btn btn-primary">Ver comandas</a></p>';
                $output.='</div></div></div></a>';
                if(($i+1)%3==0)
                {
                    $output.="</div>";
                }
            }
            $rest = 3 - $result->num_rows%3;
            if($rest == 3)
            {
                $output.='<div class="card-deck">';
            }

            if($rest!=3)
            {
                for($i=0; $i<$rest; $i++)
                {
                    $output.='<div class="card text-center" style="visibility: hidden"> <div class="card-body"></div></div>';
                }
            }
            /*for($i=0; $i<$rest; $i++)
            {
                $output.='<div class="card text-center" style="visibility: hidden"> <div class="card-body"></div></div>';
            }*/
            if($rest>0)
            {
                $output.="</div>";
            }
        }
        return $output;
    }

    function getInventory()
    {
        global $connection;
        $query = "select * from ingrediente order by nombre asc";
        $result = mysqli_query($connection, $query) or die ('"query"');   
        $output = '<table class="table table-hover">';
        $output .= '<thead> <tr>
        <td>Nombre</td><td>Cantidad</td><td>Especificación</td></tr></thead>';
        $output.= '<tbody>';
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            $critica = $row['existencia_critica'];
            $cantidad = $row['cantidad'];
            $existencia = ($critica > $row['cantidad']) ? "<td> <font color='red'>$cantidad<font> </td>" : "<td>$cantidad</td>"; 

            $output .= "<tr>";
            $output .= "<td>".$row['nombre']."</td>";
            $output .= $existencia;
            $output .= "<td>".$row['especificacion']."</td>";
            $output .= '</tr>';
        }
        $output .= '</tbody> </table>';
        return $output;
    }

    function getMessages($clave)
    {
        
    }
?>