<?php 
	include_once ("../seguridad/seguridad.php");
	include_once ("../persistencia/ordendetrabajo.php");
	$_SESSION["mensajePasado"] = "";
	
	// se determina la fecha para el dia actual
	$diahoy = mktime(0, 0, 0, date("m")  , date("d")+ 0, date("Y"));
	$diahoys = "'" . date("Y", $diahoy) . "-" . date("m", $diahoy) . "-" . date("d", $diahoy) ."'";
	// se determina la fecha dentro de 31 dias
	$diaenunmes = mktime(0, 0, 0, date("m")  , date("d")+ 31, date("Y"));
	$diaenunmess = "'" . date("Y", $diaenunmes) . "-" . date("m", $diaenunmes) . "-" . date("d", $diaenunmes) ."'";	
	// se generan los nros a desplegar en el calendario
	$numerosDiasCalendario = array();
	$celda = 0;
	for ($i = 1; $i < date('N', $diahoy); $i++){
		$numerosDiasCalendario[] = "-";
		$celda++;
	}
	for ($i = 0; $i < 31; $i++){
		$diacorriente = mktime(0, 0, 0, date("m")  , date("d")+ $i, date("Y"));
		$numerosDiasCalendario[] = date("d", $diacorriente) . "/" . date("m", $diacorriente);
		$celda++;
	}
	for ($i = $celda; $i < 42; $i++)
		$numerosDiasCalendario[] = "-";
	$_SESSION["numerosDiasCalendario"] = $numerosDiasCalendario;
	// si se llego a este script desde el controlador de generar ordenes en comercial se
	// buscan la los dias en los cuales se puede ejecutar la orden en la zona de la orden
	// de trabajo por los equipos de la zona que ya fueron filtrados en el controlador de
	// generar orden de trabajo en comercial
	if ($_SESSION["paginaAnterior"] == "controladorGeneraOTComercial.php")
	{
		$_SESSION["paginaAnterior"] = "controladorProgramarOTComercial.php";
		if(sizeof($_SESSION["listaEquipos"]) == 0)
			$_SESSION["mensajePasado"] = "No se encontraron equipos que puedan realizar la orden, cancele operacion";
		header("Location: vistaProgramarOTComercial.php");
	}
	else
	{
		$scriptSiguiente = "vistaProgramarOTComercial.php";
		// si se llego a este script haciendo click en un link del calendario se procede a asignar un equipo a la fecha elegida
		if (isset($_GET["diaElegido"]))
		{	
			if(sizeof($_SESSION["listaEquipos"]) == 0)
				$_SESSION["mensajePasado"] = "No se encontraron equipos que puedan realizar la orden, cancele operacion";
			else{
				$_SESSION["mensajePasado"] = "";
				
				echo "Dia elejido : " . $_GET["diaElegido"] . "<br>";
				$diaelegido = mktime(0, 0, 0, date("m")  , date("d")+ $_GET["diaElegido"] - date('N', $diahoy) , date("Y"));
				echo " dia elegido es : " . $diaelegido . "== " . date('N', $diaelegido) . "-" . date("d", $diaelegido) . "/" . date("m", $diaelegido) . "/" . date("Y", $diaelegido) . "<br>";
				$equipo = 0;
				$cantequipos = sizeof($_SESSION["listaEquipos"]);
				$encontre = "no";
				while (($equipo < $cantequipos) && ($encontre == "no"))
				{
					echo "dentro del wile con equipo = " . $_SESSION["listaEquipos"][$equipo] . " <br>";
					if(cuotaDelEquipoParaElDia($_SESSION["listaEquipos"][$equipo], $diaelegido) > cantidadOTdelEquipoParaElDia($_SESSION["listaEquipos"][$equipo], $diaelegido))
					{
						$exito = bloquearEquipo($_SESSION["listaEquipos"][$equipo], $_SESSION["usuario"]);
						if ($exito == "si"){
							echo "exito es si <br>";
							$orden["Equipo"] = $_SESSION["listaEquipos"];
							$_SESSION["orden"]["FechaPrevista"] = date("d / m / Y ", $diaelegido);
							$encontre="si";
							$_SESSION["orden"]["Equipo"] = $_SESSION["listaEquipos"][$equipo];
							$_SESSION["mensajePasado"] = "";
						}
						else
						{
							$_SESSION["mensajePasado"] = "El/los equipo/s que pueden realizar la OT en la fecha elegida, esta/n retenido/s por otro/s usuario/s.<br>Intentelo mas tarde o intente cambiando de fecha";
							$_SESSION["orden"]["Equipo"] = "";
							$_SESSION["orden"]["FechaPrevista"] = "";
							$equipo++;
							echo "exito es no <br>";
						}
					}	
					else
					{
						
						$equipo++;
						echo "sume a contador de equipo, ahora vales : " . $equipo . "<br>";
					}
				}
				if($encontre == "no")
				{
					if(strlen($_SESSION["mensajePasado"]) == 0){
						$_SESSION["mensajePasado"] = "No se encontro ningun equipo que pueda realizar la OT en la fecha elegida";
						$_SESSION["orden"]["Equipo"] = "";
						$_SESSION["orden"]["FechaPrevista"] = "";
						echo "encontre es no <br>";
							
					}
				}				
			}
		}
		else
		{
			$_SESSION["orden"]["Comentario"] = $_POST["comentario"];
			if (isset($_POST["confirmar"]))
			{
				if ($_SESSION["orden"]["Equipo"] != "")
					if ($_SESSION["orden"]["FechaPrevista"] != "")
					{
						// se libera el bloqueo del equipo seleccionado anteriormente VER SI ESTO VA ACA ????
						desbloquearEquipo($_SESSION["orden"]["Equipo"], $_SESSION["usuario"]);

						$scriptSiguiente = "grabarorden.php";
					}
					else
					$_SESSION["mensajePasado"] = "DEBE ESTABLECER LA FECHA PREVISTA";
				else
					$_SESSION["mensajePasado"] = "DEBE ASIGNAR UN EQUIPO PARA EJECUTAR LA ORDEN";
			}
			else 
			{
					echo "asigno variables de session";		
					$_SESSION["orden"]["Horario"] = $_POST["horario"];
					$_SESSION["orden"]["Comentario"] = $_POST["comentario"];
			}
			if (isset($_POST["cancelar"]))
				$scriptSiguiente = "../menucomercial.php";
		}
	header("Location: $scriptSiguiente");
	echo "--->" . $_SESSION["paginaAnterior"];
	}
	
?>						