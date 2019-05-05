<?php
    $pass = $_POST['pass'];
    session_start();
    $user = $_SESSION['username'];

    $connection = mysqli_connect("localhost", "root", "", "substancesoft") or die('"Fallo de conexión"'); 

    $query = "SELECT AES_DECRYPT(password,'Sub5t4nc3S0Ft') AS pass FROM usuario WHERE username = '$user'"; 

    $result = mysqli_query($connection, $query) or die ('"Error en consulta"'); //Bad query

    $row = mysqli_fetch_assoc($result);

    if($row['pass'] == $pass)
    {
        echo json_encode("ok");
    }
    else 
    {
        echo json_encode("no");
    }
    mysqli_close($connection);    
?>