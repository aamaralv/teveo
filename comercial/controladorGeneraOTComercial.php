<?php
include ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");

// se resetea el mensaje de sesion pasado entre scripts

if ($_SESSION["paginaAnterior"] == "menucomercial.php"){
	$_SESSION["paginaAnterior"] = "controladorGeneraOTComercial.php";
	$orden = array();
	$orden["TipoOrden"] = "I";
	$orden["TipoTarea"] = "I";
	$orden["SistemaEmisor"] = "C";
	$orden["TipoProducto"] = "";
	$orden["FuncionesRequeridas"] = "11111";
	$orden["NombreCliente"] = "";
	$orden["ApellidoCliente"] = "";
	$orden["Cedula"] = "";
	$orden["Telefono"] = "";
	$orden["Departamento"] = "";
	$orden["Localidad"] = "";
	$orden["Direccion"] = "";
	$orden["CodigoZona"] = "";
	$orden["FechaPrevista"] = "";
	$orden["Equipo"] = "-";
	$orden["Horario"] = "";
	$orden["Comentario"] = "";
	$_SESSION["orden"] = $orden;
	header("Location: vistaGenerarOTComercial.php");
}
else{
	$_SESSION["mensajePasado"] = "";

	if (isset($_POST["cancelar"])){
		header("Location: ../menu.php");
	}
	else
	{
		// se vuelcan a las variables de sesion los campos capturados en la pagina vistaGenerarOTComercial.php
		$_SESSION["orden"]["TipoProducto"] = $_POST["producto"];
		
		if (obtenerAplicaHabilidadesDelProducto($_SESSION["orden"]["TipoTarea"]))
			$_SESSION["orden"]["FuncionesRequeridas"] = obtenerHabilidadesTipoProducto($_POST["producto"], obtenerDescripcionTipoTarea($_SESSION["orden"]["TipoTarea"]));
		else
			$_SESSION["orden"]["FuncionesRequeridas"] = 1;

		$_SESSION["orden"]["NombreCliente"] = $_POST["nombre"];
		$_SESSION["orden"]["ApellidoCliente"] = $_POST["apellido"];
		$_SESSION["orden"]["Cedula"] = $_POST["ci"];
		$_SESSION["orden"]["Telefono"] = $_POST["telefono"];
		
		if ($_SESSION["orden"]["Departamento"] != $_POST["departamento"])
		{
			$_SESSION["orden"]["Departamento"] = $_POST["departamento"];
			$_SESSION["orden"]["Localidad"] = "";
		}
		else
		{
			$_SESSION["orden"]["Localidad"] = $_POST["localidad"];
		}
		$_SESSION["orden"]["Direccion"] = $_POST["direccion"];

		// proceso de validacion
		$scriptSiguiente = "vistaGenerarOTComercial.php";

		if (isset($_POST["confirmar"]))
		{
			if ($_SESSION["orden"]["TipoProducto"] != "")
				if ($_SESSION["orden"]["ApellidoCliente"] != "")
					if ($_SESSION["orden"]["Cedula"] != "")
						if ($_SESSION["orden"]["Telefono"] != "")
							if ($_SESSION["orden"]["Departamento"] != "")
								if ($_SESSION["orden"]["Localidad"] != "")
									if ($_SESSION["orden"]["Direccion"] != "")
									{
										// se cumplen todas las condiciones para poder programar la orden.
										$_SESSION["ver"] = 7;
										$_SESSION["orden"]["CodigoZona"] = "";
										$_SESSION["orden"]["FechaPrevista"] = "";
										$_SESSION["orden"]["Equipo"] = "";
										$_SESSION["orden"]["Horario"] = "3";
										$_SESSION["orden"]["Comentario"] = "";

										// se carga un listado de equipos que pueden actuar en la zona y
										// que por sus habilidades pueden ejecutar la orden de trabajo
										//armado de la sentencia SQL para cargar datos
										$tablaEquipos = obtenerEquiposZonaOrden($_SESSION["orden"]["Localidad"]);
										$cantElem = sizeof($tablaEquipos);
										$listaEquipos = array();
										for ($e = 0; $e < $cantElem; $e++)
										if (is_int($tablaEquipos[$e]["habilidades"] / $_SESSION["orden"]["FuncionesRequeridas"]))
										$listaEquipos[] = $tablaEquipos[$e]["identificador"];
										$_SESSION["listaEquipos"] = $listaEquipos;                             

										$scriptSiguiente = "controladorProgramarOTComercial.php";
									}
									else
									$_SESSION["mensajePasado"] = "DEBE  INGRESAR  LA  DIRECCIÓN"; 
								else 
								$_SESSION["mensajePasado"] = "DEBE  INGRESAR  LOCALIDAD  DE  LA  DIRECCIÓN";    
							else 
							$_SESSION["mensajePasado"] = "DEBE  INGRESAR  DEPARTAMENTO  DE  LA  DIRECCIÓN";    
						else 
						$_SESSION["mensajePasado"] = "DEBE  INGRESAR TELEFONO  DEL  CLIENTE";
					else 
					$_SESSION["mensajePasado"] = "DEBE  INGRESAR  CÉDULA  DEL  CLIENTE";
				else 
				$_SESSION["mensajePasado"] = "DEBE  INGRESAR  APELLIDO  DEL  CLIENTE";
			else 
			$_SESSION["mensajePasado"] = "DEBE  ELEGIR  UN  PRODUCTO";
		}
		echo "a script siguiente : Location: $scriptSiguiente<br>";
		header("Location: $scriptSiguiente");
	}
}
?>									