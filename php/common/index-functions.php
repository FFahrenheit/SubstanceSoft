<?php
    session_start();
    $permisos = array(
        array( ""),
        array( "Asignar mesa", "Crear orden", "Cancelar","Liberar" ),
        array( "Recibir", "Consultar", "Notificar"),
        array("Consultar","Ticket","Cobro","Liberar"),
        array("Crear","Cancelar","Consultar","Ticket","Cobro")
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
        $output ="";
        for($i = 0; $i < sizeof($permisos[$curMod]); $i++)
        {
            $path = "modulo".$curMod."-funcion".$i.".php";
            $output .= '<a href="../functions/'.$path.'" class="list-group-item list-group-item-action bg-light">'.$permisos[$curMod][$i].'</a>';
        }
        return $output;
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
            $output .= "<a class='navbar-brand' href='index.php?mod=$val'>";
            $output .=  $current;
            $output .=  "</a>";
        } 
        return $output;
    }

    function getModuleDescription()
    {
        global $curMod;
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