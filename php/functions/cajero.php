<?php 
    $user = $_SESSION['username'];
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
    mysqli_set_charset($connection,"utf-8"); 
    $limit = 3;

    function getOpenAccounts()
    {
        global $user, $connection;
        $query = "select * from orden where ESTADO='ABIERTA'";
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
                $output.='<img class="card-img-top img-fluid" src="../../images/cuenta.png" alt="Cuenta">';
                $output.='<div class="card-block">';
                if($row['descripcion']!="")
                {
                    $output.='<h4 class="card-title">'.$row['descripcion'].'</h4>';
                }
                else
                {
                    $output.='<h4 class="card-title">Cuenta '.$row['clave'].'</h4>';
                }
                $output.='<p class="card-text">En la mesa '.$row['mesa'].'</p>';
                $output.='<p><a href="../functions/forms/detalles-cuenta.php?clave='.$row['clave'].'" class="btn btn-primary">Consultar</a></p>';
                $output.='</div></div></div>';
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
            if($rest>0)
            {
                $output.="</div>";
            }
        }
        return $output;   
    }

    function getAccountsToClose()
    {
        global $user, $connection;
        $query = "select * from orden where ESTADO='ABIERTA'";
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
                $output.='<img class="card-img-top img-fluid" src="../../images/cuenta.png" alt="Cuenta">';
                $output.='<div class="card-block">';
                if($row['descripcion']!="")
                {
                    $output.='<h4 class="card-title">'.$row['descripcion'].'</h4>';
                }
                else
                {
                    $output.='<h4 class="card-title">Cuenta '.$row['clave'].'</h4>';
                }
                $output.='<p class="card-text">En la mesa '.$row['mesa'].'</p>';
                $output.='<p><a href="../functions/forms/cerrar.php?clave='.$row['clave'].'" class="btn btn-success">Cerrar</a></p>';
                $output.='</div></div></div>';
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
            if($rest>0)
            {
                $output.="</div>";
            }
        }
        return $output;   
    }

    function getUnpaidAccounts()
    {
        global $user, $connection;
        $query = "select * from orden where ESTADO='cerrada'";
        $result = mysqli_query($connection, $query) or die ('"query"');
        $output = "";
        if($result->num_rows!=0)
        {
            for($i=0; $i<$result->num_rows; $i++)
            {
                $row = mysqli_fetch_array($result);
                if($i%3== 0)
                {
                    $output .= '<div class="card-deck">';
                }
                $output.='<div class="card text-center">';
                $output.='<div class="card-body">';
                $output.='<img class="card-img-top img-fluid" src="../../images/cuenta.png" alt="Cuenta">';
                $output.='<div class="card-block">';
                if($row['descripcion']!="")
                {
                    $output.='<h4 class="card-title">'.$row['descripcion'].'</h4>';
                }
                else
                {
                    $output.='<h4 class="card-title">Cuenta '.$row['clave'].'</h4>';
                }
                $output.='<p class="card-text">En la mesa '.$row['mesa'].'</p>';
                $output.='<p><a href="../functions/forms/pagar.php?clave='.$row['clave'].'" class="btn btn-success">Pagar</a></p>';
                $output.='</div></div></div>';
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
            if($rest>0)
            {
                $output.="</div>";
            }
        }
        return $output;   
    }

    function getClosedAccounts($page = 0)
    {
        global $user, $connection, $limit;
        $off = $page * $limit;
        $query = "select * from orden where ESTADO='pagada' ORDER BY fecha DESC LIMIT 3 OFFSET $off";
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
                $output.='<img class="card-img-top img-fluid" src="../../images/cuenta.png" alt="Cuenta">';
                $output.='<div class="card-block">';
                if($row['descripcion']!="")
                {
                    $output.='<h4 class="card-title">'.$row['descripcion'].'</h4>';
                }
                else
                {
                    $output.='<h4 class="card-title">Cuenta '.$row['clave'].'</h4>';
                }
                $output.='<p class="card-text">En la mesa '.$row['mesa'].'</p>';
                $output.='<p><a href="../functions/forms/detalles-cuenta.php?clave='.$row['clave'].'" class="btn btn-success">Detalles</a></p>';
                $output.='</div></div></div>';
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
            if($rest>0)
            {
                $output.="</div>";
            }
            $output .= getList($page+1);
        }
        return $output;  
    }

    function getList($page)
    {
        global $connection, $limit;
        $query = "SELECT count(*) AS conteo FROM orden WHERE ESTADO='pagada'";
        $result = mysqli_query($connection,$query);
        $row = mysqli_fetch_array($result);
        $total = $row['conteo'];
        $pages = ceil($total / $limit);
        $output = '<div class="btn-group" role="group">';
        for($i = 1; $i<=$pages; $i++)
        {
            if($i == $page)
            {
                $output.='<a  class ="btn btn-secondary a-selected" href="?page='.($i-1).'">'.$i.'</a>';
            }
            else 
            {
                $output.='<a class ="btn btn-secondary a-pager"href="?page='.($i-1).'">'.$i.'</a>';
            }
        }
        $output .= '</div>';
        return $output;
    }

    function getUnimpressedAcounts()
    {
            global $user, $connection;
            $query = "select * from orden where ESTADO='cerrada'";
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
                    $output.='<img class="card-img-top img-fluid" src="../../images/cuenta.png" alt="Cuenta">';
                    $output.='<div class="card-block">';
                    if($row['descripcion']!="")
                    {
                        $output.='<h4 class="card-title">'.$row['descripcion'].'</h4>';
                    }
                    else
                    {
                        $output.='<h4 class="card-title">Cuenta '.$row['clave'].'</h4>';
                    }
                    $output.='<p class="card-text">En la mesa '.$row['mesa'].'</p>';
                    $output.='<p><a href="../functions/forms/ticket.php?clave='.$row['clave'].'" class="btn btn-success">Imprimir ticket</a></p>';
                    $output.='</div></div></div>';
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
                if($rest>0)
                {
                    $output.="</div>";
                }
            }
            return $output; 
    }
?>