<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Error en conexion"');
    mysqli_set_charset($connection,"utf-8");

    if(isset($_POST['consulta']))
    {
        $search = $_POST['consulta'];
        $query = "SELECT * FROM ingrediente 
        WHERE nombre LIKE '%$search%'
        ORDER BY nombre ASC";
    }
    else
    {
        $query = "SELECT * FROM ingrediente ORDER BY nombre ASC LIMIT 100";
    }

    $result = mysqli_query($connection, $query) or die ('"query"'); 
    
    if($result->num_rows<=0)
    {
        echo "No hay coincidencias";
    }
    else 
    {
        $output = '<table class="table table-hover">';
        $output .= '<thead> <tr>
        <td>Nombre</td>
        <td>Cantidad</td>
        <td>Especificación</td>
        <td>Crítico</td>
        <td>Agregar</td>
        </tr></thead>';
        $output.= '<tbody>';
        for($i = 0; $i<$result->num_rows; $i++)
        {
            $row = mysqli_fetch_array($result);
            $id = $row['clave'];
            $critica = $row['existencia_critica'];
            $cantidad = $row['cantidad'];
            $existencia = ($critica > $row['cantidad']) ? "<td> <font color='red'>$cantidad<font> </td>" : "<td>$cantidad</td>"; 
            $output .= "<tr>";
            $output .= "<td>".$row['nombre']."</td>";
            $output .= $existencia;
            $output .= "<td>".$row['especificacion']."</td>";
            $output .= "<td>$critica</td>";
            $btnid = "button".$id;
            $output .= "<td>
            <div class='form-inline'>
                <div class='form-group'>
                    <input type='number' size='5' class='form-control' id='$btnid' step='.01' placeholder='Cantidad a agregar'>
                    <button id = '$id' class='btn btn-success form-control' onclick = 'addInventory(this);'>
                    Ok</button>
                </div></div></td></tr>";
        }
        $output .= '</tbody> </table>';
        echo $output;
    }
    mysqli_close($connection);
?>