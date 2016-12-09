<?php
include ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");

$mensajerecibido=$_SESSION["mensajePasado"];
$siguienteScript = $_SESSION["scriptSiguiente"];

$_SESSION["mensajePasado"] = "";

if ($mensajerecibido == "salir"){
	unset($_SESSION["orden"]);
	header("Location: " . $siguienteScript);
}
else{
	// parametros que recibe:
	$nroOT = $_GET["nroOT"];

	// armado de las variables para consultar la BD
	$campos = array(
		"tipoorden",
		"tipotarea",
		"sistemaemisor",
		"tipoproducto",
		"fechahoracreacion",
		"usuariocreador",
		"fechahoradistribucion",
		"fechaprevista",
		"identificadorsupervisor",
		"equipo",
		"fechacancelacion",
		"nombrecliente",
		"apellidocliente",
		"cedula",
		"telefono",
		"direccion",
		"localidad",
		"departamento",
		"fechahoradespacho",
		"comentariosupervisor",
		"equipodespacho",
		"fechahoracierre",
		"comentarioscierre",
		"estado",
		"codigozona",
		"prioridad",
		"horario",
		"comentario",
		"funcionesrequeridas",
		"comentarioequipo");
				
	$criterios = array("numero = " . $nroOT . "");
	$resultado = "";
	$mensaje = "";

	// recuperar informacion de la orden de trabajo
	obtener_orden_de_trabajo($campos,$criterios,$resultado, $mensaje);

	// carga de los datos de la orden de trabajo a un array para luego pasarlos a la sesion
	$orden = array();
	$orden["Numero"] = $nroOT;		
	$orden["TipoOrden"] = obtenerDescripcionTipoOrden($resultado[0]["tipoorden"]);
	$orden["TipoTarea"] = obtenerDescripcionTipoTarea($resultado[0]["tipotarea"]);
	$orden["SistemaEmisor"] = obtenerDescripcionSistemaGenerador($resultado[0]["sistemaemisor"]);
	$orden["TipoProducto"] = obtenerDescripcionTipoProducto($resultado[0]["tipoproducto"]);
	$orden["FechaHoraCreacion"] = $resultado[0]["fechahoracreacion"];
	$orden["UsuarioCreador"] = obtenerNombreUsuario($resultado[0]["usuariocreador"]);
	$orden["FechaHoraDistribucion"] = $resultado[0]["fechahoradistribucion"];
	$orden["FechaPrevista"] = $resultado[0]["fechaprevista"];
	$orden["IdentificadorSupervisor"] = $resultado[0]["identificadorsupervisor"];
	$orden["Equipo"] = $resultado[0]["equipo"];
	$orden["FechaCancelacion"] = $resultado[0]["fechacancelacion"];
	$orden["NombreCliente"] = $resultado[0]["nombrecliente"];
	$orden["ApellidoCliente"] = $resultado[0]["apellidocliente"];
	$orden["Cedula"] = $resultado[0]["cedula"];
	$orden["Telefono"] = $resultado[0]["telefono"];
	$orden["Direccion"] = $resultado[0]["direccion"];
	$orden["Localidad"] = obtenerNombreLocalidad($resultado[0]["localidad"]);
	$orden["Departamento"] = obtenerNombreDepartamento($resultado[0]["departamento"]);
	$orden["FechaHoraDespacho"] = $resultado[0]["fechahoradespacho"];
	$orden["ComentariosSupervisor"] = $resultado[0]["comentariosupervisor"];
	$orden["EquipoDespacho"] = $resultado[0]["equipodespacho"];
	$orden["FechaHoraCierre"] = $resultado[0]["fechahoracierre"];
	$orden["ComentariosCierre"] = $resultado[0]["comentarioscierre"];
	$orden["Estado"] = $resultado[0]["estado"];
	$orden["CodigoZona"] = $resultado[0]["codigozona"];
	$orden["Prioridad"] = $resultado[0]["prioridad"];
	$orden["Horario"] = $resultado[0]["horario"];
	$orden["Comentario"] = $resultado[0]["comentario"];
	$orden["FuncionesRequeridas"] = $resultado[0]["funcionesrequeridas"];
	$orden["ComentariosEquipo"] = $resultado[0]["comentarioequipo"];
	
	// carga de los datos del array con los datos de la orden de trabajo en la sesion
	$_SESSION["orden"] = $orden;
	
	// llamada al script que despliega la informacion de la orden de trabajo
	header("Location: desplegarorden.php");
}
?>