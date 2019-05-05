<?php 
    $pass = $_POST['pass'];
    $user = $_POST['user'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Fallo de conexión"'); 

    $query = "UPDATE usuario SET password = 
    AES_ENCRYPT('$pass','Sub5t4nc3S0Ft'), login=NOW() WHERE username = '$user'"; 

    $result = mysqli_query($connection, $query) or die ('"Error en consulta"'); //Bad query

    echo json_encode("Exito");
    mysqli_close($connection);    
?>