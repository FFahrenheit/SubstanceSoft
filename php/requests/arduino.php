<?php 
    if(!isset($_POST['password']))
    {
        $password="";
    }
    else 
    {
        $password = $_POST['password'];
    }

    $port = $_POST['port'];
    $server = $_POST['server'];
    $ssid = $_POST['ssid'];


    $path = "powershell.exe ";
    $path .= " -Command '";
    $path .= ' $port= new-Object System.IO.Ports.SerialPort '.$port.',9600,None,8,one;';
    $path .= ' $port.open();';
    $path .= ' $port.writeline(\"a\"); ';
    $path .= ' $port.writeline(\"'.$ssid."".'\");' ;
    $path .= ' $port.writeline(\"'.$password."".'\"); ';
    $path .= ' $port.writeline(\"'.$server."".'\"); ';
    $path .= ' $port.close(); '."'";
    shell_exec("powershell -EncodedCommand " . base64_encode(iconv("UTF-8", "UTF-16LE", utf8_encode($path))));
    echo json_encode("ok");
?>