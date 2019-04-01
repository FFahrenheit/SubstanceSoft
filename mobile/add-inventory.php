<?php
    if(isset($_GET['pk']) && isset($_GET['qty']))
    {
        $pk = $_GET['pk'];
        $qty = $_GET['qty'];
    }
    else
    {
        echo '{"error":1}'; //Not var set
        die();
    }

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('{"error":2}'); //Can't connect

    $query = "SELECT cantidad from ingrediente where clave = $pk"; 

    $result = mysqli_query($connection, $query) or die ('{"error":3}'); //Bad query

    $nrows = mysqli_num_rows($result);

    if($nrows>0)
    {
        $row = mysqli_fetch_array($result); 
        $actual = $row['cantidad'];
        $actual += $qty; 

        $query = "UPDATE ingrediente SET cantidad = $actual WHERE clave=$pk";

        $result = mysqli_query($connection, $query) or die ('{"error":5}'); //Bad query

        echo '{"error":0}'; //Success
    }
    else 
    {
        echo '{"error":4}'; //Not item found
        die();
    }
?>