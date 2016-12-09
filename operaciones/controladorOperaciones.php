<?php
include ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");

$_SESSION["mensajePasado"] = "";
$_SESSION["scriptSiguiente"] = "";

$supervisor = $_SESSION["identificadorsupervisor"];
$zonaSupervisor = substr($supervisor,1,6); 

if (isset($_POST["cerrar"])){
	unset($_SESSION["listadoOrdenes"]);
	unset($_SESSION["estadoSeleccion"]);
	header("Location: ../menuoperaciones.php");
}
else
{
	// armado de los campos para realizar la consulta de listado de ordenes
	$campos = array(
		"numero",
		"estado",
		"tipoorden",
		"sistemaemisor",
		"fechahoracreacion",
		"fechaprevista",
		"equipo",
		"nombrecliente",
		"apellidocliente",
		"localidad",
		"departamento",);

	$criterios = array("(estado = 'generada' OR estado = 'programada' OR estado = 'pre-cerrada' OR estado = 'demorada')", "localidad = '" . $zonaSupervisor . "'");
	$_SESSION["estadoSeleccion"] = "Todos los estados";
	if (isset($_POST["estadoFiltro"]))
	{	
		if ($_POST["estadoFiltro"] == "generada"){
			$criterios = array("(estado = 'generada')", "localidad = '" . $zonaSupervisor . "'");
			$_SESSION["estadoSeleccion"] = "generada";
		}
		else
			if ($_POST["estadoFiltro"] == "programada"){
				$criterios = array("(estado = 'programada')", "localidad = '" . $zonaSupervisor . "'");
				$_SESSION["estadoSeleccion"] = "programada";
			}
			else
				if ($_POST["estadoFiltro"] == "pre-cerrada"){
					$criterios = array("(estado = 'pre-cerrada')", "localidad = '" . $zonaSupervisor . "'");
					$_SESSION["estadoSeleccion"] = "pre-cerrada";
				}
				else
					if ($_POST["estadoFiltro"] == "demorada"){
						$criterios = array("(estado = 'demorada')", "localidad = '" . $zonaSupervisor . "'");
						$_SESSION["estadoSeleccion"] = "demorada";
					}
	}
	$resultados = "";
	$mensaje = "";

	// ejecucion de la consulta de listado de ordenes
	listar_ordenes_de_trabajo($campos,$criterios,$resultados, $mensaje);

	$_SESSION["listadoOrdenes"] = $resultados;
	$_SESSION["mensajePasado"] = "";
	$_SESSION["scriptSiguiente"] = "controladorListarOrdenes.php";

	// llamado al script que despliega el listado de ordenes
	header("Location: vistaListarOrdenesOperaciones.php");
}
?>