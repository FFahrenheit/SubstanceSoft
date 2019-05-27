<?php
	$connection = mysqli_connect("localhost", "root", "", "substancesoft") or die("'error'");
	if(isset($_POST['order']) && isset($_POST['type']) && isset($_POST['com']) && isset($_POST['imp']))
	{
		$order = $_POST['order'];
		$type = $_POST['type'];
		$com = $_POST['com'];
		$imp = $_POST['imp'];
		$query ="SELECT nombre FROM cocina WHERE clave = $order";
        $result = mysqli_query($connection,$query);
        $row = mysqli_fetch_array($result);
        $nombre = $row['nombre'];
	}
 	require __DIR__ . '/ticket/autoload.php'; //Nota: si renombraste la carpeta a algo diferente de "ticket" cambia el nombre en esta línea
	use Mike42\Escpos\Printer;
	use Mike42\Escpos\EscposImage;
	use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;


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

/*
	Ahora vamos a imprimir un encabezado
*/

$printer->text("\n".$nombre. "\n");
#La fecha también
date_default_timezone_set("America/Mexico_City");
$printer->text(date("Y-m-d H:i:s") . "\n");
$printer->text("" . "\n");
$printer->setJustification(Printer::JUSTIFY_LEFT);
$printer->text("------------------------------------------"."\n");
$printer->text("Platillos                             Mesa.\n");
$printer->text("------------------------------------------"."\n");
/*
	Ahora vamos a imprimir los
	productos
*/
$query = "select pedidos.clave as pk, 
platillo.nombre as platillo, orden.mesa as mesa, pedidos.hora as hora 
from platillo, orden, pedidos 
where platillo.clave = pedidos.platillo and platillo.cocina = $clave
and pedidos.estado = 'pedido' and orden.clave = pedidos.orden order by pedidos.estado";

	$result = mysqli_query($connection,$query);
	/*Alinear a la izquierda para la cantidad y el nombre*/
	$total=0;
	$printer->setJustification(Printer::JUSTIFY_LEFT);
		while($row = mysqli_fetch_array($result))
		{
            $printer->text($row['nombre']."\n");
            $printer->text($row['mesa']."\n");
		}
/*
	Terminamos de imprimir
	los productos, ahora va el total
*/
$printer->text("------------------------------------------"."\n");


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
