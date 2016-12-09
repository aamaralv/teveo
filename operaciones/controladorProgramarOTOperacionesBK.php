<?php

include_once ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");

$ot = $_GET["ordenElegida"];

echo "Orden Elegida: " . $ot . "<br>";

$_SESSION["mensajePasado"] = "";

// Se obtiene el día actual en formato fecha y se pasa a string 
$diahoy = mktime(0, 0, 0, date("m")  , date("d")+ 0, date("Y"));
$diahoys = "'" . date("Y", $diahoy) . "-" . date("m", $diahoy) . "-" . date("d", $diahoy) ."'";
// Se obtiene que día sera dentro de 31 dias en formato fecha y se pasa a string
$diaenunmes = mktime(0, 0, 0, date("m")  , date("d")+ 31, date("Y"));
$diaenunmess = "'" . date("Y", $diaenunmes) . "-" . date("m", $diaenunmes) . "-" . date("d", $diaenunmes) ."'";

if (isset($_GET["diaElegido"]))
{	
	// se eligio un dia, se carga en la variable de sesion
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

		if (bloquearEquipo($_POST["equipo"], $_SESSION["usuario"]) )) "si") 
		{
			// se libera el bloqueo del equipo seleccionado anteriormente
			desbloquearEquipo($_SESSION["orden"]["Equipo"], $usuario){

			$_SESSION["orden"]["FechaPrevista"] = "";
			$_SESSION["orden"]["Equipo"] = $_POST["equipo"];

			echo "se levanta de la BD informacion<br>";
			// se cargan 2 vectores de 31 posisiones las cuotas del equipo para cada dia segun el tipo de dia
			// correspondiente y un vector con la cantidad de cuotas que el equipo tiene asignadas para ese dia.

			$listaCuotas = array();
			$listaCantOrdenes = array();
			
			for ($i = 0; $i < 31; $i++){
				$diaCorriente = mktime(0, 0, 0, date("m")  , date("d")+ $i, date("Y"));
				$listaCuotas = cuotaDelEquipoParaElDia($_SESSION["orden"]["Equipo"], $diaCorriente);
				$listaCantOrdenes = cantidadOTdelEquipoParaElDia($_SESSION["orden"]["Equipo"], $diaCorriente);
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

	if (isset($_POST["cancelar"])){
		echo "Cancelar<br>";
		// se libera el bloqueo del equipo seleccionado si existe seleccion
		desbloquearEquipo($_SESSION["orden"]["Equipo"], $usuario)
		$scriptSiguiente = "controladorOperaciones.php";
	}
	else
	{
		// proceso de validacion
		$scriptSiguiente = "vistaProgramarOTOperaciones";

		if (isset($_POST["confirmar"]))
		{
			if ($_SESSION["orden"]["Equipo"] != "")
				if ($_SESSION["orden"]["FechaPrevista"] != "")
				{
					// Se actualiza Orden de trabajo
					
					// se libera el bloqueo del equipo seleccionado anteriormente
					desbloquearEquipo($_SESSION["orden"]["Equipo"], $usuario);
					$scriptSiguiente = "controladorOperaciones.php";
				}
				else
					$_SESSION["mensajePasado"] = "DEBE ESTABLECER LA FECHA PREVISTA";
			else
				$_SESSION["mensajePasado"] = "DEBE ASIGNAR UN EQUIPO PARA EJECUTAR LA ORDEN";
		}
	}
	header("Location: $scriptSiguiente");
}

?>