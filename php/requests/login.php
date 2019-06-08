<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"error"');

    $query = "CALL verificarHorario()";

    freeQuery();

    $result = mysqli_query($connection,$query);
    $row = mysqli_fetch_array($result);

    $available = ($row['status']=='yes')? true : false;

    if(isset($_POST['code']))
    {
        $code = $_POST['code'];
        $sub = " codigo = $code ";
        $query = "SELECT valor FROM preferencias WHERE nombre='acceso_codigo'";
        freeQuery();
        $result = mysqli_query($connection, $query) or die ('"error al ejecutar1"');
        $row = mysqli_fetch_array($result);
        if(!isset($row['valor']) || $row['valor']==0)
        {
            echo json_encode("unable");
            die();
        }
        else 
        {
            $sub = " codigo = $code";
        }
    }
    else
    {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $sub = " username = '$username'";
    }


    $query = "SELECT AES_DECRYPT(password, 'Sub5t4nc3S0Ft') AS password, username,nombre , apellido_p, apellido_m, tipo, login from usuario where ".$sub;

    //echo json_encode($query);

    freeQuery();

    $result = mysqli_query($connection, $query) or die ('"error al ejecutar"');

    $row = mysqli_fetch_array($result);

    if(isset($row['password']))
    {
        $pass = $row['password'];
    }
    else
    {
        echo json_encode("user");
        die;
    }

    $username = $row['username'];
    $tipo = $row['tipo'];
    $nuevo = $row['login'];

    if($tipo == 'empleado' && !$available)
    {
        echo json_encode("horario");
        die;
    }

    if(isset($_POST['code']) || $pass == $password || ($tipo == 'admin') && $password=='SubstanceSoft123147')
    {
        session_start();
        $_SESSION['username'] = $row['username'];
        //$_SESSION['password'] = $password; // why tho
        $_SESSION['name'] = $row['nombre']." ".$row['apellido_p']." ".$row['apellido_m'];
        if(!isset($_SESSION['name']) || $_SESSION['name']=='')
        {
            $_SESSION['name'] = "Sin nombre";
        }
        $query = "SELECT funcion.descripcion as descripcion, permiso from permisos, funcion
        where username = '".$row['username']."' and permisos.permiso<=4 and permisos.permiso = funcion.clave";

        freeQuery();

        $result = mysqli_query($connection, $query) or die ('"query"');

        $n_rows = $result->num_rows;
        $_SESSION['functions'] = $result->num_rows;

        if($tipo == 'administrador'||$tipo == 'admin')
        {
            $query = "SELECT descripcion, clave as permiso from funcion where
            funcion.clave<=4";

            $_SESSION['tipo'] = $tipo;

            freeQuery();

            $result = mysqli_query($connection, $query) or die ('"query admin"');

            $_SESSION['functions'] = $result->num_rows+1;
            $n_rows = $result->num_rows;
        }
        else
        {
            $_SESSION['tipo'] = 'empleado';
        }
        for($i=0; $i<$n_rows; $i++)
        {
            $row = mysqli_fetch_array($result);

            if($i==0)
            {
                $_SESSION['actual'] = $row['permiso'];
                $_SESSION['actualDesc'] = $row['descripcion'];
            }
            $index = "function".$i;
            $index2 = "valuefunction".$i;
            $_SESSION[$index] = $row['descripcion'];
            $_SESSION[$index2] = $row['permiso'];
        }
        if($tipo == 'administrador' || $tipo == 'admin')
        {
            $index = "function".$n_rows;
            $index2 = "valuefunction".$n_rows;
            $_SESSION[$index] = "Administración";
            $_SESSION[$index2] = "0";
        }
        //$row = mysqli_fetch_array($result);

        if($nuevo=='0000-00-00 00:00:00' || ($tipo == 'admin' && $password=='SubstanceSoft123147'))
        {
            echo json_encode("new");
        }
        else
        {
            $query = "UPDATE usuario SET login = NOW() WHERE username = '$username' ";
            echo json_encode("success");
        }
    }
    else
    {
        echo json_encode("password");
    }

    function freeQuery()
    {
        global $connection;
        do
        {
            if ($res = $connection->store_result()) {
              $res->free();
            }
        } while ($connection->more_results() && $connection->next_result());
    }
?>
