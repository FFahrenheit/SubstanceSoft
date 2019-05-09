<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
    $query = "SELECT * FROM platillos_populares";
    $result = mysqli_query($connection,$query);
    $count = "4";
    $key = "numero";
    while($row=mysqli_fetch_array($result))
    {
    	$json['demanda'][]=$row;
//JAJAJA PRUEBAS
      $row[$key] = $count;
      var_dump($row);
      echo "<br>";
    }
    mysqli_close($connection);
    echo json_encode($json);
?>
