<?php 
    if(isset($_POST['new']))
    {
        $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha conectar"');

        if($_POST['new'] == 'true')
        {
            $query = "UPDATE preferencias SET valor = 1 WHERE nombre = 'acceso_codigo'";
        }
        else
        {
            $query = "UPDATE preferencias SET valor = 0 WHERE nombre = 'acceso_codigo'";
        }
        $result = mysqli_query($connection, $query) or die('"Fallo"');
        echo json_encode($_POST['new']);
    }
    else 
    {
        echo json_encode("estado invalido");
    }
?>