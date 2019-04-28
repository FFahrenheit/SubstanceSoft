<?php
    $user = $_SESSION['username'];
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
    mysqli_set_charset($connection,"utf8");

    function getOrderCommands()
    {
        global $user, $connection;
        $query = "select * from orden where ESTADO='ABIERTA'";
        if($_SESSION['tipo']!='administrador')
        {
            $query.= " and usuario = '$user'";
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
                $output.='<div class="card text-center">';
                $output.='<div class="card-body">';
                $output.='<img class="card-img-top img-fluid" src="../../images/orden.png" alt="Orden">';
                $output.='<div class="card-block">';
                if($row['descripcion']!="")
                {
                    $output.='<h4 class="card-title">'.$row['descripcion'].'</h4>';
                }
                else
                {
                    $output.='<h4 class="card-title">Mesa'.$row['mesa'].'</h4>';
                }
                $output.='<p class="card-text">En la mesa '.$row['mesa'].'</p>';
                $output.='<p><a href="../functions/forms/marcar-comanda.php?clave='.$row['clave'].'" class="btn btn-primary">Marcar</a></p>';
                $output.='</div></div></div>';
                if(($i+1)%3==0)
                {
                    $output.="</div>";
                }
            }
            $rest = 3- $result->num_rows%3;
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

    function getOpenOrders()
    {
        global $user, $connection;
        $query = "select * from orden where ESTADO='ABIERTA'";
        if($_SESSION['tipo']!='administrador')
        {
            $query.= " and usuario = '$user'";
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
                $output.='<div class="card text-center">';
                $output.='<div class="card-body">';
                $output.='<img class="card-img-top img-fluid" src="../../images/orden.png" alt="Orden">';
                $output.='<div class="card-block">';
                if($row['descripcion']!="")
                {
                    $output.='<h4 class="card-title">'.$row['descripcion'].'</h4>';
                }
                else
                {
                    $output.='<h4 class="card-title">Mesa'.$row['mesa'].'</h4>';
                }
                $output.='<p class="card-text">En la mesa '.$row['mesa'].'</p>';
                $output.='<p><a href="../functions/forms/nueva-comanda.php?clave='.$row['clave'].'" class="btn btn-primary">Agregar</a></p>';
                $output.='<p><a href="../functions/forms/cancelacion.php?clave='.$row['clave'].'" class="btn btn-danger">Cancelar</a></p>';
                $output.='<p><a href="../functions/forms/cerrar.php?clave='.$row['clave'].'" class="btn btn-success">Cerrar</a></p>';
                $output.='</div></div></div>';
                if(($i+1)%3==0)
                {
                    $output.="</div>";
                }
            }
            $rest = 3- $result->num_rows%3;
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

        function  getOrdersForAdd()
        {
            global $user, $connection;
            $query = "select * from orden where ESTADO='ABIERTA'";
            if($_SESSION['tipo']!='administrador')
            {
                $query.= " and usuario = '$user'";
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
                    $output.='<a href="../functions/forms/nueva-comanda.php?clave='.$row['clave'].'" class="a-card">';
                    $output.='<div class="card text-center">';
                    $output.='<div class="card-body">';
                    $output.='<img class="card-img-top img-fluid" src="../../images/orden.png" alt="Orden">';
                    $output.='<div class="card-block">';
                    if($row['descripcion']!="")
                    {
                        $output.='<h4 class="card-title">'.$row['descripcion'].'</h4>';
                    }
                    else
                    {
                        $output.='<h4 class="card-title">Mesa'.$row['mesa'].'</h4>';
                    }
                    $output.='<p class="card-text">En la mesa '.$row['mesa'].'</p>';
                    $output.='<p><a href="../functions/forms/nueva-comanda.php?clave='.$row['clave'].'" class="btn btn-primary">Agregar</a></p>';
                    $output.='</div></div></div></a>';
                    if(($i+1)%3==0)
                    {
                        $output.="</div>";
                    }
                }
                $rest = 3- $result->num_rows%3;
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

        function getOrdersForCancel()
        {
            global $user, $connection;
            $query = "select * from orden where ESTADO='ABIERTA'";
            if($_SESSION['tipo']!='administrador')
            {
                $query.= " and usuario = '$user'";
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
                    $output.='<a href="../functions/forms/cancelacion.php?clave='.$row['clave'].'" class="a-card">';
                    $output.='<div class="card text-center">';
                    $output.='<div class="card-body">';
                    $output.='<img class="card-img-top img-fluid" src="../../images/orden.png" alt="Orden">';
                    $output.='<div class="card-block">';
                    if($row['descripcion']!="")
                    {
                        $output.='<h4 class="card-title">'.$row['descripcion'].'</h4>';
                    }
                    else
                    {
                        $output.='<h4 class="card-title">Mesa '.$row['mesa'].'</h4>';
                    }
                    $output.='<p class="card-text">En la mesa '.$row['mesa'].'</p>';
                    $output.='<p><a href="../functions/forms/cancelacion.php?clave='.$row['clave'].'" class="btn btn-danger">Cancelar</a></p>';
                    $output.='</div></div></div></a>';
                    if(($i+1)%3==0)
                    {
                        $output.="</div>";
                    }
                }
                $rest = 3- $result->num_rows%3;
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
        function getOpenOrdersForClosing()
        {
            global $user, $connection;
            $query = "select * from orden where ESTADO='ABIERTA'";
            if($_SESSION['tipo']!='administrador')
            {
                $query.= " and usuario = '$user'";
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
                    $output.='<a href="../functions/forms/cerrar.php?clave='.$row['clave'].'" class="a-card">';
                    $output.='<div class="card text-center">';
                    $output.='<div class="card-body">';
                    $output.='<img class="card-img-top img-fluid" src="../../images/orden.png" alt="Orden">';
                    $output.='<div class="card-block">';
                    if($row['descripcion']!="")
                    {
                        $output.='<h4 class="card-title">'.$row['descripcion'].'</h4>';
                    }
                    else
                    {
                        $output.='<h4 class="card-title">Mesa '.$row['mesa'].'</h4>';
                    }
                    $output.='<p class="card-text">En la mesa '.$row['mesa'].'</p>';
                    $output.='<p><a href="../functions/forms/cerrar.php?clave='.$row['clave'].'" class="btn btn-success">Cerrar</a></p>';
                    $output.='</div></div></div></a>';
                    if(($i+1)%3==0)
                    {
                        $output.="</div>";
                    }
                }
                $rest = 3- $result->num_rows%3;
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
?>