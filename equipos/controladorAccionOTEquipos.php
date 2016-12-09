<?php

include_once ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");

$_SESSION["mensajePasado"] = "";

if (isset($_GET["ordenElegida"]))
{
	$orden = array();
	$orden["Numero"] = $_GET["ordenElegida"];
	$orden["Estado"] = $_GET["accion"];
	$_SESSION["orden"] = $orden;
	header("Location:vistaAccionOTEquipos.php");
}
else
{
	if (isset($_POST["cancelar"]))
	{
		unset($_SESSION["orden"]);
		
		echo "No se hace nada, se vuelve al listado de ordenes del supervisor<br>";
		
		header("Location: controladorGestionOTEquipos");
	}
	else
	{
		if (isset($_POST["confirmar"]))
		{	

			if(strlen($_POST["comentarioCierre"]) > 0)
				$comentariosprecierre = $_POST["comentarioPreCierre"];
			else
				$comentariosprecierre = "EL TECNICO NO INGRESO COMENTARIOS DE CIERRE.";
			// se actualizan los campos necesarios para canccelar la orden
			echo "Se Cierra la orden de trabajo <br>";
			$fechahoraprecierre = date("Y-m-d H:i:s");
			$valores = array (
							  "comentarioequipo ='"  . $fechahoraprecierre . "|" . $comentariosprecierre . "'",
							  "estado = '" . $_SESSION["orden"]["Estado"] . "'"
			);
			$criterios = array("numero = '" . $_SESSION["orden"]["Numero"] . "'");
			$mensaje = "";
			
			actualizar_orden_de_trabajo($valores,$criterios,$mensaje);

			unset($_SESSION["orden"]);
			header("Location: controladorGestionOTEquipos.php");
		}
	}
}
?>