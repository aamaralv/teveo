<?php
include ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");

$mensajerecibido=$_SESSION["mensajePasado"];

$_SESSION["mensajePasado"] = "";

if ($mensajerecibido == "salir"){
	unset($_SESSION["orden"]);
	header("Location: ../menucomercial.php");
}
else{
	// parametros que recibe:
	$nroOT = $_GET["nroOT"];
	$sigueinteScript = $_GET["siguienteScript"];

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

	echo "nro ot recibida  : " . $nroOT . "<br>";
	echo "sigueinte script : " . $sigueinteScript . "<br>";

	obtener_orden_de_trabajo($campos,$criterios,$resultado, $mensaje);

		$orden = array();
		$orden["Numero"] = $nroOT;
		$orden["TipoOrden"] = obtenerDescripcionTipoOrden($resultado["tipoorden"]);
		$orden["TipoTarea"] = obtenerDescripcionTipoTarea($resultado["tipotarea"]);
		$orden["SistemaEmisor"] = obtenerDescripcionSistemaGenerador($resultado["sistemaemisor"]);
		echo "tipo producto codigo recibido " . $resultado["tipoproducto"] . "<br>";
		echo "tipo producto nombre  " . obtenerDescripcionTipoProducto($resultado["tipoproducto"]) . "<br>";
		$orden["TipoProducto"] = obtenerDescripcionTipoProducto($resultado["tipoproducto"]);
		$orden["FechaHoraCreacion"] = $resultado["fechahoracreacion"];
		$orden["UsuarioCreador"] = obtenerNombreUsuario($resultado["usuariocreador"]);
		$orden["FechaHoraDistribucion"] = $resultado["fechahoradistribucion"];
		$orden["FechaPrevista"] = $resultado["fechaprevista"];
		$orden["IdentificadorSupervisor"] = $resultado["identificadorsupervisor"];
		$orden["Equipo"] = $resultado["equipo"];
		$orden["FechaCancelacion"] = $resultado["fechacancelacion"];
		$orden["NombreCliente"] = $resultado["nombrecliente"];
		$orden["ApellidoCliente"] = $resultado["apellidocliente"];
		$orden["Cedula"] = $resultado["cedula"];
		$orden["Telefono"] = $resultado["telefono"];
		$orden["Direccion"] = $resultado["direccion"];
		echo "antes de nombre localidad <br>";
		$orden["Localidad"] = obtenerNombreLocalidad($resultado["localidad"]);
		echo "antes de nombre departamento <br>";
		$orden["Departamento"] = obtenerNombreDepartamento($resultado["departamento"]);
		echo "despues de nombre departamento <br>";
		$orden["FechaHoraDespacho"] = $resultado["fechahoradespacho"];
		$orden["ComentariosSupervisor"] = $resultado["comentariosupervisor"];
		$orden["EquipoDespacho"] = $resultado["equipodespacho"];
		$orden["FechaHoraCierre"] = $resultado["fechahoracierre"];
		$orden["ComentariosCierre"] = $resultado["comentarioscierre"];
		$orden["Estado"] = $resultado["estado"];
		$orden["CodigoZona"] = $resultado["codigozona"];
		$orden["Prioridad"] = $resultado["prioridad"];
		$orden["Horario"] = $resultado["horario"];
		$orden["Comentario"] = $resultado["comentario"];
		$orden["FuncionesRequeridas"] = $resultado["funcionesrequeridas"];
		$orden["ComentariosEquipo"] = $resultado["comentarioequipo"];
		
		$_SESSION["orden"] = $orden;


		echo "mensaje : " . $mensaje . "<br>";

		print_r($resultado);

		header("Location: desplegarorden.php");
}
?>