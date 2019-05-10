<?php 
    $cocina = $_POST['nombre'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die;

    $query = "SELECT nombre FROM cocina WHERE nombre!='$cocina'";

    $result = mysqli_query($connection, $query) or die("error");
    $out = "";
    
    while($row = mysqli_fetch_array($result))
    {
        $out .= '<option id="'.$row['clave'].'" >'.$row['nombre'].'</option>'; 
    }

    echo $out;
    return $out;
    mysqli_close($connection);
?>