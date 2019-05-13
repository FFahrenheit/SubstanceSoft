<?php
  $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
  $query = "SELECT * FROM horarios";
  $result = mysqli_query($connection,$query);
  while($row=mysqli_fetch_array($result))
  {
    $json['horarios'][]=$row;
  }
  mysqli_close($connection);
  echo json_encode($json);
?>
