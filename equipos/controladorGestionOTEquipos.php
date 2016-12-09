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
	header("Location: ../menuequipos.php");
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

	$criterios = array("(estado = 'programada' OR estado = 'despachada')", "equipo = '" . $_SESSION["identificadorequipo"] . "'");
	$_SESSION["estadoSeleccion"] = "Todos los estados";
	if (isset($_POST["estadoFiltro"]))
	{	
		if ($_POST["estadoFiltro"] == "programada")
		{
			$criterios = array("(estado = 'programada')", "equipo = '" . $_SESSION["identificadorequipo"] . "'");
			$_SESSION["estadoSeleccion"] = "programada";
		}
		else
			if ($_POST["estadoFiltro"] == "despachada")
			{
				$criterios = array("(estado = 'despachada')", "equipo = '" . $_SESSION["identificadorequipo"] . "'");
				$_SESSION["estadoSeleccion"] = "despachada";
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
	header("Location: vistaGestionOTEquipos.php");
}
?>