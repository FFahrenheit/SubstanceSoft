<?php
	$connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("'error'");
	if(isset($_POST['order']) && isset($_POST['type']) && isset($_POST['com']) && isset($_POST['imp']))
	{
		$order = $_POST['order'];
		$type = $_POST['type'];
		$com = $_POST['com'];
		$imp = $_POST['imp'];
		$query ="UPDATE orden SET impresiones = impresiones + 1 WHERE clave = $order";
		$result = mysqli_query($connection,$query);
	}
	else 
	{
		$order = 20;
		$type = "local";
		$com = "";
		$imp = "Substance";
	}
	//$order = 33; R U SURE?
 	require __DIR__ . '/ticket/autoload.php'; //Nota: si renombraste la carpeta a algo diferente de "ticket" cambia el nombre en esta línea
	use Mike42\Escpos\Printer;
	use Mike42\Escpos\EscposImage;
	use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;


/*
	Este ejemplo imprime un
	ticket de venta desde una impresora térmica
*/


/*
    Aquí, en lugar de "POS" (que es el nombre de mi impresora)
	escribe el nombre de la tuya. Recuerda que debes compartirla
	desde el panel de control
*/
if($imp == "")
{
	echo json_encode('"Configura una impresora"');
	die;
}
if($type == "Remota")
{
	$nombre_impresora = "smb://".$com."/".$imp;
}
else
{
	$nombre_impresora = $imp;
}


$connector = new WindowsPrintConnector($nombre_impresora);
$printer = new Printer($connector);
#Mando un numero de respuesta para saber que se conecto correctamente.
/*
	Vamos a imprimir un logotipo
	opcional. Recuerda que esto
	no funcionará en todas las
	impresoras

	Pequeña nota: Es recomendable que la imagen no sea
	transparente (aunque sea png hay que quitar el canal alfa)
	y que tenga una resolución baja. En mi caso
	la imagen que uso es de 250 x 250
*/

# Vamos a alinear al centro lo próximo que imprimamos
$printer->setJustification(Printer::JUSTIFY_CENTER);

/*
	Intentaremos cargar e imprimir
	el logo
*/
try{
	$logo = EscposImage::load("128x128.png", false);
    $printer->bitImage($logo);
}catch(Exception $e){/*No hacemos nada si hay error*/}

/*
	Ahora vamos a imprimir un encabezado
*/

$printer->text("\n"."SubstanceSoft" . "\n");
$printer->text("INFOTRONICA CETI COLOMOS" . "\n");
#La fecha también
date_default_timezone_set("America/Mexico_City");
$printer->text(date("Y-m-d H:i:s") . "\n");
$printer->text("" . "\n");
$printer->setJustification(Printer::JUSTIFY_LEFT);
$printer->text("------------------------------------------"."\n");
$printer->setJustification(Printer::JUSTIFY_CENTER);
$printer->text("GRACIAS POR TU VISITA"."\n");
$printer->text("Luis Gabriel Hernandez Hernandez"."\n");
$printer->text("3323857013"."\n");
$printer->text("lghhssi@gmail.com"."\n");
$printer->text("Ismael Iván López Murillo"."\n");
$printer->text("3314702601"."\n");
$printer->text("diskman199@gmail.com"."\n");
$printer->text("------------------------------------------"."\n");
/*
	Ahora vamos a imprimir los
	productos
*/

/*Alimentamos el papel 3 veces*/
$printer->feed(2);

/*
	Cortamos el papel. Si nuestra impresora
	no tiene soporte para ello, no generará
	ningún error
*/

/*
	Por medio de la impresora mandamos un pulso.
	Esto es útil cuando la tenemos conectada
	por ejemplo a un cajón
*/
$printer->pulse();

/*
	Para imprimir se tiene que "cerrar"
	la conexión con la impresora. Recuerda incluir esto al final de todos los archivos
*/
$printer->cut();
$printer->close();
echo json_encode("'Exito'");
?>
