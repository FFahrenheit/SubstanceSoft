<?php
  exec('md %userprofile%\Documents\SubstanceSoft_Backup');
  exec('"C:\xampp\mysql\bin\mysqldump.exe" -v --opt --events --routines --triggers --default-character-set=utf8 -u root substancesoft > %userprofile%/Documents/SubstanceSoft_Backup/backup.sql');
  echo json_encode("Exito!");
?>
