<?php
    $username = $_POST['username'];
    $password = $_POST['password'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');

    $query = "SELECT password, nombre , apellido_p, apellido_m from usuario where username='$username'"; 

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

    if($pass == $password)
    {
        session_start();
        $_SESSION['username'] = $username;
        $_SESSION['password'] = $password;
        $_SESSION['name'] = $row['nombre']." ".$row['apellido_p']." ".$row['apellido_m'];
        $query = "SELECT funcion.descripcion as descripcion, permiso from permisos, funcion where 
        username='$username' and permisos.permiso<=4 and permisos.permiso = funcion.clave"; 

        $result = mysqli_query($connection, $query) or die ('"query"');

        $n_rows = $result->num_rows;
        $_SESSION['functions'] = $result->num_rows;
        
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
        $row = mysqli_fetch_array($result); 

        echo json_encode("success");
    }
    else
    {
        echo json_encode("password");
    }
?>