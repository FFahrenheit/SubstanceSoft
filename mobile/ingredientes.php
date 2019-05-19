<?php
  $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
  $query = "SELECT * from uso_ingredientes";
  $result = mysqli_query($connection,$query);
  while($row=mysqli_fetch_array($result))
  {
    $suma['uso'][]=$row;
  }
  $count = 0;
  $query = "SELECT * from surtido_ingredientes";
  $result = mysqli_query($connection,$query);
  $times = count($suma['uso']);
  while($row=mysqli_fetch_array($result))
  {
    $surtido['sum'][]=$row;
  }
  $count = 0;
  $query = "SELECT * FROM titulos_ingredientes";
  $times2 = count($surtido['sum']);
  $result = mysqli_query($connection,$query);
  while($row=mysqli_fetch_array($result))
  {
    $cut = substr($row['nombre'], 0, strpos($row['nombre'], '('));
    for ($i = 0; $i < $times; $i++)
    {
      if($suma['uso'][$i]['nombre'] == $cut)
      {
        $row['suma_uso'] = $suma['uso'][$i]['suma'];
      }
    }
    for ($i = 0; $i < $times; $i++)
    {
      if($surtido['sum'][$i]['nombre'] == $cut)
      {
        $row['suma_surtido'] = $surtido['sum'][$i]['suma'];
      }
    }
    $count = $count+1;
    $json['ingredientes'][]=$row;
  }
  mysqli_close($connection);
  echo json_encode($json);
?>
