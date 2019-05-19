<?php 
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
    mysqli_set_charset($connection,"utf-8");

    function getEstado($preferencia)
    {
        global $connection;
        $query = "SELECT valor FROM preferencias WHERE nombre = '$preferencia'";
        $result = mysqli_query($connection,$query);
        $row = mysqli_fetch_array($result);
        return ($row['valor']==0)? "<font color='red'>Deshabilitado</font>" : "<font color='green'>Habilitado</font>";
    }

    function getPreferencias()
    {
        $output = '<table class="table table-hoover"
            <table><thead><tr>
            <td>Preferencia</td>
            <td>Estado</td>
            <td>&nbsp;</td>
            </tr></thead><tbody>';

        $output.=  '<tr>';
        $output.=  "<td>Acceso con código</td>";
        $output.=  "<td>".getEstado("acceso_codigo");
        $output.=  '<td><a href="../forms/gestionar-codigos.php" class="btn btn-primary">Administrar</a></td>';
        $output.=  '</tr>';

        $output.=  '<tr>';
        $output.=  "<td>Apagado dinámico</td>";
        $output.=  "<td>".getEstado("apagado_dinamico");
        $output.=  '<td><a href="../forms/gestionar-horario.php" class="btn btn-primary">Administrar</a></td>';
        $output.=  '</tr>';

        $output.=  '<tr>';
        $output.=  "<td>Desperdicio de ingredientes</td>";
        $output.=  "<td>".getEstado("desperdicio_diario");
        $output.=  '<td><a href="../forms/gestionar-desperdicio.php" class="btn btn-primary">Administrar</a></td>';
        $output.=  '</tr>';

        $output.= '<tr>';
        $output.=  "<td>Desperdicio de ingredientes</td>";
        $output.=  "<td>".getEstado("desperdicio_diario");
        $output.=  '<td><a href="../forms/gestionar-desperdicio.php" class="btn btn-primary">Administrar</a></td>';
        $output.=  '</tr>';


        $output.= '<tr>';
        $output.=  "<td>Modo de notificación chef</td>";
        if(getEstado("notificacion_chef")=="<font color='red'>Deshabilitado</font>")
        {
            $show = "<font color = 'green'>Modo con sistema</font>";
        }
        else 
        {
            $show = "<font color = 'red'>Modo independiente</font>";
        }
        $output .= '<td>'.$show.'</td>';
        $output.=  '<td><a href="../forms/gestionar-modo.php" class="btn btn-primary">Administrar</a></td>';
        $output.=  '</tr>';
        $output.= '</tbody></table>';

        return $output;
    }
?>