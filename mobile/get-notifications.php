<?php
    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('{"error":1}');
    $query = "SELECT * FROM notificaciones ORDER BY fecha ASC LIMIT 0,15";
    $result = mysqli_query($connection, $query) or die ('{"error":2}');
    while($row=mysqli_fetch_array($result))
    {
      $json[]=$row;
    }
    mysqli_close($connection);
    echo json_encode($json);
?>
