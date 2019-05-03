<?php
    session_start();
    $permisos = array(
        array("Administrar base", "Estadísticas", "Inventario", "Preferencias"),
        array( "Asignar mesa", "Crear orden", "Cancelar","Liberar", "Marcar comanda"),
        array( "Recibir comandas", "Inventario", "Notificar comanda lista"),
        array("Consultar","Ticket","Cobro","Liberar","Historial"),
        array("Crear","Cancelar","Consultar","Cerrar","Ticket","Cobro"),
        array("Liberar", "Inventario", "Cuenta", "Ticket")
      );
      if(isset($_GET['mod']))
      {
          $curMod = $_GET['mod'];
          $_SESSION['actual'] = $curMod;
      }
      else
      {
          $curMod = $_SESSION['actual'];
      }

      function getSideBar()
      {
        global $permisos;
        global $curMod;

        if($curMod==5)
        {
            return getIndividual();
        }
        $output ="";
        for($i = 0; $i < sizeof($permisos[$curMod]); $i++)
        {
            $path = "modulo".$curMod."-funcion".$i.".php";
            $output .= '<a href="../functions/'.$path.'" class="list-group-item list-group-item-action ss-sb">'.$permisos[$curMod][$i].'</a>';
        }

        return $output;
    }

    function getUser()
    {
        echo $_SESSION['username'];
    }

    function getIndividual()
    {
        global $curMod;
        global $permisos;
        $output="";
        $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
        $query = "SELECT * from permisos where permiso>4 and username = '".$_SESSION['username']."'";
        $result = mysqli_query($connection, $query) or die ('"query fallida"');
        for($i=0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result); 
            $path = "modulo".$curMod."-funcion".$i.".php";
            $output .= '<a href="../functions/'.$path.'" class="list-group-item list-group-item-action ss-sb">'.$permisos[$curMod][$i].'</a>';
        }
        return $output;
    }

    function getLogStatusChange($module)
    {
        if(!isset($_SESSION['username']))
        {
            header("Location: /substancesoft/views/menus/login.html");
            exit();
        }
        else 
        {
            global $curMod;
            $curMod = $module; 
            $_SESSION['actual'] = $module;
        }
    }

    function getLogStatus()
    {
        if(!isset($_SESSION['username']))
        {
            header("Location: /substancesoft/views/menus/login.html");
            exit();   
        }
    }
    function getNavBar()
    {
        $output="";
        for($i=0; $i<$_SESSION['functions'];$i++)
        { 
            $desc = "function".$i;
            $var = "valuefunction".$i;
            $current = $_SESSION[$desc];
            $val = $_SESSION[$var];
            $output .= "<a class='navbar-brand' href='../../views/menus/index.php?mod=$val'>";
            $output .=  $current;
            $output .=  "</a>";
        }
        $output .= getIndividuals();
        return $output;
    }

    function getIndividuals()
    {
        $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
        $query = "SELECT * from permisos where permiso>4 and username = '".$_SESSION['username']."'";
        $result = mysqli_query($connection, $query) or die ('"query fallida"');
        if($result->num_rows>0)
        {
            return "<a class='navbar-brand' href='http://localhost/substancesoft/views/menus/index.php?mod=5'>
            Individuales </a>";
        }
        else
        {
            return "";
        }
    }

    function getModuleDescription()
    {
        global $curMod;
        if($curMod==0)
        {
            return "Administración del sistema";
        }
        $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
        $query = "SELECT descripcion FROM FUNCION WHERE CLAVE = $curMod"; 
        $result = mysqli_query($connection, $query) or die ('"query"');
        $row = mysqli_fetch_array($result); 
        return $row['descripcion'];
    }

    function getUserStatus()
    {
        $output = "";
        $output .= '<h3 class="mt4">';
        $output .= $_SESSION['name'];
        $output .= '</h3>';
        $output .= '<h4 class="mt4">';
        $output .= $_SESSION['username'];
        $output .= "</h4>";
        $output .= '<div id="chat">'.getChat().' </div>';
        $output.='<p><a href="../functions/forms/mensajes.php?clave='.$_SESSION['username'].'" class="btn btn-link">Ver últimos mensajes</a></p>';
        return $output;
    }

    function getChat($option = false)
    {
        $user  =  $_SESSION['username'];
        $out = "";
        $new = false;
        $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
        mysqli_set_charset($connection,"utf8");

        $query = "SELECT * FROM mensajes WHERE destinatario = '$user' ORDER BY fecha DESC LIMIT 5";

        $result = mysqli_query($connection, $query) or die ('"query fallida"');

        while($row = mysqli_fetch_array($result))
        {
            if($row['visto']==1)
            {
                $out .= '<div class="chat">';
            }
            else 
            {
                $new = true;
                $out .= '<div class="chat darker">';
            }
            $out .= "<p>".$row['texto']."</p>";
            $out .= '<span class="time-right">'.$row['fecha'].'</span>';
            $out .= "</div>";
        }
        if(!$option) //Si no es update
        {
            return $out;
        }
        else 
        {
            if($new)
            {
                return $out;
            }
            else 
            {
                return "void";
            }
        }
    }
?>