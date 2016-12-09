<?php

include_once ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");

$nroOT = $_GET["ordenElegida"];

echo "Orden Elegida: " . $nroOT . "<br>";

// se recupera de la bd si el supervisor le asigno equipo.
// armado de las variables para consultar la BD
$campos = array(
	"equipo",
	"equipodespacho"
	);
			
$criterios = array("numero = " . $nroOT . "");
$resultado = "";
$mensaje = "";

// recuperar informacion de la orden de trabajo
obtener_orden_de_trabajo($campos,$criterios,$resultado, $mensaje);

// si en la bd no hay ingresado equipodespacho significa que el supervisor no le asigno equipo y se debe sacar con el equipo de generacion 
if(strlen($resultado[0]["equipodespacho"]<10))
	$equipodespacho = $resultado[0]["equipo"];
else
	$equipodespacho = $resultado[0]["equipodespacho"];

// se actualizan los campos necesarios para canccelar la orden
echo "Se despacha la orden de trabajo <br>";
$valores = array (
				  "identificadorsupervisor = '" . $_SESSION["identificadorsupervisor"] . "'",
				  "fechahoradistribucion = '". date("Y-m-d H:i:s") . "'",
				  "fechahoradespacho = '". date("Y-m-d H:i:s") . "'",
				  "equipodespacho = '" . $equipodespacho . "'",
				  "estado = 'despachada'"
);
$criterios = array("numero = '" . $nroOT . "'");
$mensaje = "";

actualizar_orden_de_trabajo($valores,$criterios,$mensaje);

header("Location: controladorOperaciones");

?>