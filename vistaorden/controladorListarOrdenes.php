<?php
include ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");

$_SESSION["mensajePasado"] = "";

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

listar_ordenes_de_trabajo($campos,$criterios,$resultados, $mensaje);

// print_r($resultados);

$_SESSION["listadoOrdenes"] = $resultados;

header("Location: vistaListarOrdenes.php");

?>