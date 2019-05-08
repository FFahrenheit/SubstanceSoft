<?php
	if(isset($_POST['order']))
	{
		$order = $_POST['order'];
	}
	$order = 33;
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
$user = "ivan_mente_poder_619@hotmail.com";
$password = "Carcamo2k15";
$nombre_impresora = "smb://LAPTOP-1N4BGTT0/Substance";

$connector = new WindowsPrintConnector($nombre_impresora);
$printer = new Printer($connector);
#Mando un numero de respuesta para saber que se conecto correctamente.
echo json_encode($order);
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
$printer->text("Direccion: CETI COLOMOS" . "\n");
$printer->text("Tel: 3310146661" . "\n");
$printer->text("Orden #".$order."\n");
#La fecha también
date_default_timezone_set("America/Mexico_City");
$printer->text(date("Y-m-d H:i:s") . "\n");
$printer->text("" . "\n");
$printer->setJustification(Printer::JUSTIFY_LEFT);
$printer->text("------------------------------------------"."\n");
$printer->text("CANT                 P.U        IMP.\n");
$printer->text("------------------------------------------"."\n");
/*
	Ahora vamos a imprimir los
	productos
*/
$connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("'error'");
$query = "CALL obtenerTicket($order)";
	$result = mysqli_query($connection,$query);
	/*Alinear a la izquierda para la cantidad y el nombre*/
	$total=0;
	$printer->setJustification(Printer::JUSTIFY_LEFT);
		while($row = mysqli_fetch_array($result))
		{
			$esp = ($row['conteo']==1)? "pieza  " : "piezas";
			$printer->text($row['nombre']."\n");
			$printer->text($row['conteo']." $esp          ".$row['precio']."       ".$row['subtotal']."\n");
			$total += $row['subtotal'];
		}
/*
	Terminamos de imprimir
	los productos, ahora va el total
*/
$printer->text("------------------------------------------"."\n");
$printer->setJustification(Printer::JUSTIFY_RIGHT);
$printer->text("TOTAL: $".$total."\n");


/*
	Podemos poner también un pie de página
*/
$printer->setJustification(Printer::JUSTIFY_CENTER);
$printer->text("Muchas gracias por su compra(empa es gei)\n");



/*Alimentamos el papel 3 veces*/
$printer->feed(3);

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
$printer->close();

?>
