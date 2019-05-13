<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
    $query = "SELECT * FROM platillos_populares";
    $result = mysqli_query($connection,$query);
    while($row=mysqli_fetch_array($result))
    {
    	$json['demanda'][]=$row;
    }
    mysqli_close($connection);
    echo $json['demanda'][0]['nombre'];
    echo json_encode($json);
?>
