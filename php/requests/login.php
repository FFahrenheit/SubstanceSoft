<?php
    $username = $_POST['username'];
    $password = $_POST['password'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');

    $query = "SELECT password, nombre , apellido_p, apellido_m, tipo from usuario where username='$username'"; 

    $result = mysqli_query($connection, $query) or die ('"query"');

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

    $tipo = $row['tipo'];

    if($pass == $password)
    {
        session_start();
        $_SESSION['username'] = $username;
        //$_SESSION['password'] = $password;
        $_SESSION['name'] = $row['nombre']." ".$row['apellido_p']." ".$row['apellido_m'];
        $query = "SELECT funcion.descripcion as descripcion, permiso from permisos, funcion where 
        username='$username' and permisos.permiso<=4 and permisos.permiso = funcion.clave"; 

        $result = mysqli_query($connection, $query) or die ('"query"');

        $n_rows = $result->num_rows;
        $_SESSION['functions'] = $result->num_rows;

        if($tipo == 'administrador')
        {
            $query = "SELECT descripcion, clave as permiso from funcion where
            funcion.clave<=4";

            $_SESSION['tipo'] = 'administrador';

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
        if($tipo == 'administrador')
        {
            $index = "function".$n_rows;
            $index2 = "valuefunction".$n_rows;
            $_SESSION[$index] = "Administración";
            $_SESSION[$index2] = "0";
        }
        //$row = mysqli_fetch_array($result); 

        echo json_encode("success");
    }
    else
    {
        echo json_encode("password");
    }
?>