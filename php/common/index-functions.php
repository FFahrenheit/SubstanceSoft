<?php
    session_start();
    $permisos = array(
        array("Administrar base", "Estadísticas", "Inventario"),
        array( "Asignar mesa", "Crear orden", "Cancelar","Liberar" ),
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
            $output .= '<a href="../functions/'.$path.'" class="list-group-item list-group-item-action bg-light">'.$permisos[$curMod][$i].'</a>';
        }

        return $output;
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
            $output .= '<a href="../functions/'.$path.'" class="list-group-item list-group-item-action bg-light">'.$permisos[$curMod][$i].'</a>';
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
        $curMod = $module; 
        $_SESSION['actual'] = $module;
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
            $output .= "<a class='navbar-brand' href='http://localhost/substancesoft/views/menus/index.php?mod=$val'>";
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
        //Message management
        $output .= '<p class="well">Message</p>';
        $output .= '<p class="border">Message</p>';
        return $output;
    }
?>