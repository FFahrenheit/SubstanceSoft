<?php
  $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"connection"');
  $query = "SELECT COUNT(tab.usuario) as 'suma', tab.usuario FROM
  (select pedidos.hora as 'hora', usuario from pedidos, orden where orden.clave = pedidos.orden)
  AS tab
  WHERE tab.hora >= (SELECT valor from fechas where nombre='fecha_in')
  AND tab.hora <= (SELECT valor from fechas where nombre='fecha_fin')
  GROUP BY tab.usuario
  ORDER BY tab.usuario";
  $result = mysqli_query($connection,$query);
  while($row=mysqli_fetch_array($result))
  {
    $suma['suma'][]=$row;
  }
  $count = 0;
  $query = "SELECT * FROM usuario_ordenes";
  $result = mysqli_query($connection,$query);
  while($row=mysqli_fetch_array($result))
  {
    $row['suma_total'] = $suma['suma'][$count]['suma'];
    $count = $count+1;
    $json['participacion'][]=$row;
  }
  mysqli_close($connection);
  echo json_encode($json);
?>
