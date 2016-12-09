<?php
include ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");

$_SESSION["mensajePasado"] = "";

if (isset($_POST["cerrar"])){
	unset($_SESSION["listadoOrdenes"]);
	header("Location: ../menucomercial.php");
}
else
{
	// armado de los campos para realizar la consulta de listado de ordenes
	$campos = array(
		"numero",
		"tipoorden",
		"sistemaemisor",
		"fechahoracreacion",
		"usuariocreador",
		"fechaprevista",
		"equipo",
		"nombrecliente",
		"apellidocliente",
		"localidad",
		"departamento",
		"estado");

	$criterios = array("'1'");
	$resultados = "";
	$mensaje = "";

	// ejecucion de la consulta de listado de ordenes
	listar_ordenes_de_trabajo($campos,$criterios,$resultados, $mensaje);

	$_SESSION["listadoOrdenes"] = $resultados;
	$_SESSION["mensajePasado"] = "";
	$_SESSION["scriptSiguiente"] = "controladorListarOrdenes.php";

	// llamado al script que despliega el listado de ordenes
	header("Location: vistaListarOrdenes.php");
}
?>