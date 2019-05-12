<?php
  $connection = mysqli_connect("localhost", "root", "") or die('"connection"');
  $query = "DROP DATABASE IF EXISTS substancesoft";
  $result = mysqli_query($connection, $query);
  $query = "CREATE DATABASE substancesoft";
  $result = mysqli_query($connection, $query);
  exec ('"C:\xampp\mysql\bin\mysql.exe" -u root substancesoft < %userprofile%/Documents/SubstanceSoft_Backup/backup.sql');
  echo json_encode("Exito!");
?>
