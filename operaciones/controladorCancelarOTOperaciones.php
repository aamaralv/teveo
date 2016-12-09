<?php

include_once ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");

$_SESSION["mensajePasado"] = "";

if (isset($_POST["cancelar"]))
{
	unset($_SESSION["orden"]);
	
	echo "No se hace nada, se vuelve al listado de ordenes del supervisor<br>";
	
	header("Location: controladorOperaciones");
}
else
{
	if (isset($_POST["confirmar"]))
	{	

		if(strlen($_POST["comentarioCierre"]) >= 5)
		{
			// se actualizan los campos necesarios para canccelar la orden
			echo "Se Anuló la orden de trabajo <br>";
			$valores = array (
							  "identificadorsupervisor = '" . $_SESSION["identificadorsupervisor"] . "'",
							  "fechacancelacion = '". date("Y-m-d H:i:s") . "'",
							  "comentariosupervisor = '" . $_POST["comentarioCierre"] ."'",
							  "estado = 'cancelada'"
			);
			$criterios = array("numero = '" . $_SESSION["orden"]["Numero"] . "'");
			$mensaje = "";
			
			actualizar_orden_de_trabajo($valores,$criterios,$mensaje);

			unset($_SESSION["orden"]);
			header("Location: controladorOperaciones");
	    }
		else{
			$_SESSION["mensajePasado"] = "Debe ingresar un comentario con el motivo de cierre (5 caracteres minimo).";
			header("Location: vistaCancelarOTOperaciones.php");
		}
	}
	else
	{

		$nroOT = $_GET["ordenElegida"];
		echo "Orden Elegida: " . $nroOT . "<br>";

		// armado de las variables para consultar la BD
		$campos = array(
			"tipoorden",
			"tipotarea",
			"sistemaemisor",
			"tipoproducto",
			"fechahoracreacion",
			"usuariocreador",
			"nombrecliente",
			"apellidocliente",
			"cedula",
			"telefono",
			"direccion",
			"localidad",
			"departamento",
			"estado",
			"funcionesrequeridas"
			);
					
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
		$orden["NombreCliente"] = $resultado[0]["nombrecliente"];
		$orden["ApellidoCliente"] = $resultado[0]["apellidocliente"];
		$orden["Cedula"] = $resultado[0]["cedula"];
		$orden["Telefono"] = $resultado[0]["telefono"];
		$orden["Direccion"] = $resultado[0]["direccion"];
		$orden["Localidad"] = obtenerNombreLocalidad($resultado[0]["localidad"]);
		$orden["Departamento"] = obtenerNombreDepartamento($resultado[0]["departamento"]);
		$orden["Estado"] = $resultado[0]["estado"];
		$orden["FuncionesRequeridas"] = $resultado[0]["funcionesrequeridas"];
		
		// carga de los datos del array con los datos de la orden de trabajo en la sesion
		$_SESSION["orden"] = $orden;

		header("Location: vistaCancelarOTOperaciones.php");

	}
}
?>