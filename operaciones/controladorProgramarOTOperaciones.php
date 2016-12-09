<?php

include_once ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");

$_SESSION["mensajePasado"] = "";

if (isset($_GET["ordenElegida"]))
{
	// Se recupera el nro de orden de trabajo elejido
	$nroOT = $_GET["ordenElegida"];
	echo "Orden Elegida: " . $nroOT . "<br>";

	// se cargan de la BD los campos de la OS que se necesitan para desplegar por pantalla
	$campos = array(
		"fechaprevista",
		"equipo",
		"equipodespacho",
		"horario",
		"prioridad",
		"comentario",
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
	$orden["FechaPrevista"] = $resultado[0]["fechaprevista"];
	$orden["Equipo"] = $resultado[0]["equipo"];
	$orden["EquipoDespacho"] = $resultado[0]["equipodespacho"];
	$orden["Horario"] = $resultado[0]["horario"];
	$orden["Prioridad"] = $resultado[0]["prioridad"];
	$orden["Comentario"] = $resultado[0]["comentario"];
	$orden["FuncionesRequeridas"] = $resultado[0]["funcionesrequeridas"];
	$_SESSION["orden"] = $orden;	

	// se obtiene una lista de los equipos que gestiona el supervisor logueado	
	$listaEquiposDelSupervisor = listaEquiposDelSupervisor($_SESSION["identificadorsupervisor"]);
	// se filtran solo los equipos que tiene las habilidades para realizar la orden de trabajo.
	$listaEquiposElegibles = array();
	for ($i = 0; $i < sizeof($listaEquiposDelSupervisor); $i++)
		if (is_int($listaEquiposDelSupervisor[$i]["habilidades"] / $_SESSION["orden"]["FuncionesRequeridas"]))
			$listaEquiposElegibles[] = $listaEquiposDelSupervisor[$i]["identificador"];
	if (sizeof($listaEquiposElegibles) == 0)
		$_SESSION["mensajePasado"] = "NO HAY EQUIPOS CON LAS HABILIDADES REQUERIDAS, DEBE ELVAR UN EQUIPO";
	$_SESSION["listaEquipos"] = $listaEquiposElegibles;
	
	$_SESSION["ver"] = 7;
	
	echo "se levanta de la BD informacion<br>";
	// se cargan 2 vectores de 31 posisiones las cuotas del equipo para cada dia segun el tipo de dia
	// correspondiente y un vector con la cantidad de cuotas que el equipo tiene asignadas para ese dia.

	$listaCuotas = array();
	$listaCantOrdenes = array();
	
	for ($i = 0; $i < 31; $i++){
		$diaCorriente = mktime(0, 0, 0, date("m")  , date("d")+ $i, date("Y"));
		$listaCuotas[] = cuotaDelEquipoParaElDia($_SESSION["orden"]["Equipo"], $diaCorriente);
		$listaCantOrdenes[] = cantidadOTdelEquipoParaElDia($_SESSION["orden"]["Equipo"], $diaCorriente);
	}
	
	$_SESSION["cuotas"] = $listaCuotas;
	$_SESSION["cuotasCubiertas"] = $listaCantOrdenes;

	echo "cuota asignadas :<br><br><br><br><br>";
	print_r($_SESSION["cuotas"]);
	echo "<br><br><br><br><br>";
	echo "cuota cubierta :<br><br><br><br><br>";
	print_r($_SESSION["cuotasCubiertas"]);
	echo "<br><br><br><br><br>";
	
	header("Location: vistaProgramarOTOperaciones.php");
}
else
{
	if (isset($_GET["diaElegido"]))
	{	
		// se eligio un dia de una lista, no de una tabla, se carga en la variable de sesion
		echo "Dia elejido : " . $_GET["diaElegido"] . "<br>";
		
		$_SESSION["desplazamiento"] = $_GET["diaElegido"];
		$time = time();

		echo date("d / m / Y (H:i:s)", $time) ."<br>";

		$time = $time + $_GET["diaElegido"] * (60*60*24);

		echo date("d / m / Y ", $time) ."<br>";

		$_SESSION["orden"]["FechaPrevista"] = date("d / m / Y ", $time);
		echo "valor de FechaPrevista en sesion: " . $_SESSION["orden"]["FechaPrevista"] . "<br>";
		header("Location: vistaProgramarOTOperaciones.php");
	}
	else
	{
		if (isset($_POST["cancelar"]))
		{
			echo "Se eligio Cancelar<br>";
			// se libera el bloqueo del equipo seleccionado si existe seleccion
			desbloquearEquipo($_SESSION["orden"]["Equipo"], $_SESSION["usuario"]);
			$scriptSiguiente = "controladorOperaciones.php";
		}
		else
		{
			if (isset($_POST["confirmar"]))
			{
				if ($_SESSION["orden"]["Equipo"] != "")
					if ($_SESSION["orden"]["FechaPrevista"] != "") // Aca capaz que conviene verificar que la fecha no sea  menor a la del dia
					{
						// Se actualiza Orden de trabajo

						if(strlen($_POST["comentario"]) > 0)
							$comentario = $_POST["comentario"];
						else
							$comentario = "EL SUPERVISOR NO INGRESO COMENTARIOS DE PROGRAMACIÓN.";
						// se actualizan los campos necesarios para canccelar la orden
						echo "Se Cierra la orden de trabajo <br>";
						$valores = array (
										  "identificadorsupervisor = '" . $_SESSION["identificadorsupervisor"] . "'",
										  "fechaprevista = '". substr($_SESSION["orden"]["FechaPrevista"],10,4) . "-" . substr($_SESSION["orden"]["FechaPrevista"],5,2) . "-". substr($_SESSION["orden"]["FechaPrevista"],0,2) . "'", 
										  "fechahoradespacho = '". date("Y-m-d H:i:s") . "'", 
										  "equipo = '" . $_SESSION["orden"]["Equipo"] . "'",
										  "equipodespacho = '" . $_SESSION["orden"]["Equipo"] . "'",
										  "comentariosupervisor = '" . $_SESSION["orden"]["Comentario"] ."'",
										  "estado = 'programada'"
						);
						$criterios = array("numero = '" . $_SESSION["orden"]["Numero"] . "'");
						$mensaje = "";
						
						actualizar_orden_de_trabajo($valores,$criterios,$mensaje);

						unset($_SESSION["orden"]);
						header("Location: controladorOperaciones");

						// se libera el bloqueo del equipo seleccionado anteriormente
						desbloquearEquipo($_SESSION["orden"]["Equipo"], $_SESSION["usuario"]);
						$scriptSiguiente = "controladorOperaciones.php";
					}
					else
					{
						$_SESSION["mensajePasado"] = "DEBE ESTABLECER LA FECHA PREVISTA";
					}
				else
				{
					$_SESSION["mensajePasado"] = "DEBE ASIGNAR UN EQUIPO PARA EJECUTAR LA ORDEN";
				}
			}
			else
			{
				// HACER ACTUALIZACIONES de campos para la vista,
				// no se eligio un dia se llego por un a este scrip desde un POST o desde controladorOperaciones
				echo "Post del combo de fecha" . $_POST["diaUnico"] ."<br>";
				
				// se verifica si se eligio un dia particular de un listado, no se una tabla de 7 o 31 dias
				$_SESSION["desplazamiento"] = $_POST["diaUnico"];
				if ($_POST["diaUnico"] < 1000){
					$time = time();
					$time = $time + $_POST["diaUnico"] * (60*60*24);
					$_SESSION["orden"]["FechaPrevista"] = date("d / m / Y ", $time);
				}
				else
					$_SESSION["orden"]["FechaPrevista"] = "";
				
				$_SESSION["orden"]["Horario"] = $_POST["horario"];
				$_SESSION["orden"]["Comentario"] = $_POST["comentario"];
				echo "Horario elejido : " . $_SESSION["orden"]["Horario"] . "<br>";
				echo "Select equipo   : " . $_POST["equipo"] . ".<br>";
				
				// si se cambi el equipo se vuelven a levantar todos los valores para el equipo elegido
				// tambien se entra qui si se vino de controladorOperaciones.php
				
				if($_POST["equipo"] != $_SESSION["orden"]["Equipo"])
				{
					// si se va a cambiar de equipo es necesario verificar que las ordenes asignadas
					// al equipo que se pretende asignar no se estan manipulando en otra seleccion
					// ya que dos usuarios podrian estar modificando las cuotas de un mismo equipo
					// en simulataneo y asignar a un equipo una cantidad de ordenes superios a la cuota
					// que el equipo tiene asignada para ese dia. 

					if (bloquearEquipo($_POST["equipo"], $_SESSION["usuario"]) == "si")  
					{
						// se libera el bloqueo del equipo seleccionado anteriormente
						desbloquearEquipo($_SESSION["orden"]["Equipo"], $_SESSION["usuario"]);

						$_SESSION["orden"]["FechaPrevista"] = "";
						$_SESSION["orden"]["Equipo"] = $_POST["equipo"];

						echo "se levanta de la BD informacion<br>";
						// se cargan 2 vectores de 31 posisiones las cuotas del equipo para cada dia segun el tipo de dia
						// correspondiente y un vector con la cantidad de cuotas que el equipo tiene asignadas para ese dia.

						$listaCuotas = array();
						$listaCantOrdenes = array();
						
						for ($i = 0; $i < 31; $i++){
							$diaCorriente = mktime(0, 0, 0, date("m")  , date("d")+ $i, date("Y"));
							$listaCuotas[] = cuotaDelEquipoParaElDia($_SESSION["orden"]["Equipo"], $diaCorriente);
							$listaCantOrdenes[] = cantidadOTdelEquipoParaElDia($_SESSION["orden"]["Equipo"], $diaCorriente);
						}
						
						$_SESSION["cuotas"] = $listaCuotas;
						$_SESSION["cuotasCubiertas"] = $listaCantOrdenes;

						echo "cuota asignadas :<br><br><br><br><br>";
						print_r($_SESSION["cuotas"]);
						echo "<br><br><br><br><br>";
						echo "cuota cubierta :<br><br><br><br><br>";
						print_r($_SESSION["cuotasCubiertas"]);
						echo "<br><br><br><br><br>";
					} 
					else 
					{
						echo "Error: El equipo esta bloqueado por otro usuario <br>";
						$_SESSION["mensajePasado"] = "El equipo elejido esta siendo coordinado por otro usuario, espere a que lo libere o elija otro equipo";
					}
				}

				$_SESSION["ver"] = $_POST["ver"];
				echo "Dias a visualizar : " . $_SESSION["ver"] . "<br>";
				$scriptSiguiente = "vistaProgramarOTOperaciones.php";
				
			}
		}
		header("Location: " . $scriptSiguiente);
	}
}


?>