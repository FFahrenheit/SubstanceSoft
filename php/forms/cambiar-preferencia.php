<?php 
    if(isset($_POST['new']))
    {
        $codigo = $_POST['preferencia'];
        $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"No se ha conectar"');

        if($_POST['new'] == 'true')
        {
            $query = "UPDATE preferencias SET valor = 1 WHERE nombre = '$codigo'";
        }
        else
        {
            $query = "UPDATE preferencias SET valor = 0 WHERE nombre = '$codigo'";
        }
        $result = mysqli_query($connection, $query) or die('"Fallo"');
        if($codigo == 'desperdicio_diario')
        {
            $valor = ($_POST['new']=='true')? 5 : 0;
            $query = "UPDATE preferencias SET valor = $valor WHERE nombre = 'razon_desperdicio'";
            $result = mysqli_query($connection,$query) or die("'error al actualizar a 0'");
        }
        echo json_encode($_POST['new']);
    }
    else 
    { 
        echo json_encode("estado invalido");
    }
?>