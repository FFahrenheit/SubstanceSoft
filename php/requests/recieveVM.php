<?php
  $file = addslashes(file_get_contents($_FILES['sql']['tmp_name']));
  $fp = fopen('C:/users/%userprofile%/Documents/SubstanceSoft_Backup/backup.sql', 'w');
  fwrite($fp, $file);
  fclose($fp);
?>
