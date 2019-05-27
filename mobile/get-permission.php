<?php
  $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
  $query = "SELECT * FROM preferencias WHERE nombre = 'aplicacion_movil'";
  $result = mysqli_query($connection,$query);
  while($row=mysqli_fetch_array($result))
  {
    $json=$row;
  }
  mysqli_close($connection);
  echo json_encode($json);
?>
