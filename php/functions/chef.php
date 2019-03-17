<?php 
    $user = $_SESSION['username'];
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');

    function getAvailableKitchens()
    {
        global $user, $connection;
        $query = "select cocina.nombre as nombre, chefs.cocina as pk from chefs, cocina where
        chefs.usuario = '$user' and cocina.clave = chefs.cocina";
        $result = mysqli_query($connection, $query) or die ('"query"');
        $output = "";
        if($result->num_rows!=0)
        {
            for($i=0; $i<$result->num_rows; $i++)
            {
                $row = mysqli_fetch_array($result);
                if($i%4 == 0)
                {
                    $output .= '<div class="card-deck">';
                }
                $output.='<div class="card text-center">';
                $output.='<div class="card-body">';
                $output.='<img class="card-img-top img-fluid" src="../../images/cocinas.png" alt="Cocina">';
                $output.='<div class="card-block">';
                $output.='<h4 class="card-title">Cocina: '.$row['nombre'].'</h4>';
                $output.='<p class="card-text"></p>';
                $output.='<p><a href="../functions/forms/visualizar.php?clave='.$row['pk'].'" class="btn btn-primary">Ver y notificar</a></p>';
                $output.='</div></div></div>';
                if(($i+1)%4==0)
                {
                    $output.="</div>";
                }
            }
            $rest = 4- $result->num_rows%4;
            for($i=0; $i<$rest; $i++)
            {
                $output.='<div class="card text-center" style="visibility: hidden"> <div class="card-body"></div></div>';
            }
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
        $query = "select cocina.nombre as nombre, chefs.cocina as pk from chefs, cocina where
        chefs.usuario = '$user' and cocina.clave = chefs.cocina";
        $result = mysqli_query($connection, $query) or die ('"query"');
        $output = "";
        if($result->num_rows!=0)
        {
            for($i=0; $i<$result->num_rows; $i++)
            {
                $row = mysqli_fetch_array($result);
                if($i%4 == 0)
                {
                    $output .= '<div class="card-deck">';
                }
                $output.='<div class="card text-center">';
                $output.='<div class="card-body">';
                $output.='<img class="card-img-top img-fluid" src="../../images/cocinas.png" alt="Cocina">';
                $output.='<div class="card-block">';
                $output.='<h4 class="card-title">Cocina: '.$row['nombre'].'</h4>';
                $output.='<p class="card-text"></p>';
                $output.='<p><a href="../functions/forms/ver.php?clave='.$row['pk'].'" class="btn btn-primary">Ver comandas</a></p>';
                $output.='</div></div></div>';
                if(($i+1)%4==0)
                {
                    $output.="</div>";
                }
            }
            $rest = 4- $result->num_rows%4;
            for($i=0; $i<$rest; $i++)
            {
                $output.='<div class="card text-center" style="visibility: hidden"> <div class="card-body"></div></div>';
            }
            if($rest>0)
            {
                $output.="</div>";
            }
        }
        return $output;
    }

    function getInventory()
    {
        global $user, $connection;
        $query = "select * from ingrediente";
        $result = mysqli_query($connection, $query) or die ('"query"');   
        $output = '<table class="table table-hover">';
        $output .= '<thead> <tr>
        <td>Nombre</td><td>Cantidad</td><td>Especificación</td></tr></thead>';
        $output.= '<tbody>';
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            $output .= "<tr>";
            $output .= "<td>".$row['nombre']."</td>";
            $output .= "<td>".$row['cantidad']."</td>";
            $output .= "<td>".$row['especificacion']."</td>";
            $output .= '</tr>';
        }
        $output .= '</tbody> </table>';
        return $output;
    }
?>