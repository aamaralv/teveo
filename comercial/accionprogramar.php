<?php 
include ("../seguridad/seguridad.php");
include ("../persistencia/conexion.php");
include ("../persistencia/funcionesBD.php");
//conecto con la base de datos
$conexion = conectarBD($bdhost, $bduser, $bdpass);						 
//selecciono la BBDD
establecerBD($conexion, $bdbase);

$_SESSION["mensajePasado"] = "";
/*
function feriado( $dia){
	return 0;
}
*/



                        $diahoy = mktime(0, 0, 0, date("m")  , date("d")+ 0, date("Y"));
			$diahoys = "'" . date("Y", $diahoy) . "-" . date("m", $diahoy) . "-" . date("d", $diahoy) ."'";
                        $diaenunmes = mktime(0, 0, 0, date("m")  , date("d")+ 31, date("Y"));
			$diaenunmess = "'" . date("Y", $diaenunmes) . "-" . date("m", $diaenunmes) . "-" . date("d", $diaenunmes) ."'";
// carga de los feriados
			$tabla = "feriados";
			$campos = "fecha";
			$criterios = "(fecha BETWEEN " . $diahoys . " AND " . $diaenunmess . ")";
			echo "Criterio : $criterios <br>";
			echo "Campos : $campos <br>";
			echo "tabla : $tabla <br>"; 
			//Ejecuto la sentencia
			$tablarsferiados = consultarEnBD($conexion, $tabla, $campos, $criterios);


                        echo "tabla rs feriados<br>";
                        print_r($tablarsferiados);
echo "<br>";
                        $feriados = array();
                        foreach ($tablarsferiados as $linea) {
                           $feriados[strtotime($linea['fecha'])]="";
                        }










if (isset($_GET["diaElegido"]))
{	
echo "Dia elejido : " . $_GET["diaElegido"] . "<br>";
$_SESSION["desplazamiento"] = $_GET["diaElegido"];
        $time = time();

echo date("d / m / Y (H:i:s)", $time) ."<br>";

        $time = $time + $_GET["diaElegido"] * (60*60*24);

echo date("d / m / Y ", $time) ."<br>";

	$_SESSION["orden"]["FechaPrevista"] = date("d / m / Y ", $time);
	echo "valor de FechaPrevista en sesion: " . $_SESSION["orden"]["FechaPrevista"] . "<br>";
        header("Location: programacion.php");
}
else
	{
                echo "Post del combo de fecha" . $_POST["diaUnico"] ."<br>";
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
		if($_POST["equipo"] != $_SESSION["orden"]["Equipo"]){
                    
                    // si se va a cambiar de equipo es necesario verificar que las ordenes asignadas
                    // al equipo que se pretende asignar no se estan manipulando en otra seleccion
                    // ya que dos usuarios podrian estar modificando las cuotas de un mismo equipo
                    // en simulataneo y asignar a un equipo una cantidad de ordens superios a la cuota
                    // que el equipo tiene asignada para ese dia. 
                   

                    $sqlstr = "INSERT INTO equiposbloqueados (equipo, usuario) VALUES ('" . $_POST["equipo"] . "', '" . $_SESSION["usuario"] . "')";                   
                     echo "SQL de insersion :" . $sqlstr . "<br>";
 
                      if (mysql_query($sqlstr, $conexion)) {
                          echo "New record created successfully";


                         // se libera el bloqueo del equipo seleccionado anteriormente
                         $tabla = "equiposbloqueados";
                         $criterios = "equipo='" . $_SESSION["orden"]["Equipo"] . "'";
                         borrarEnBD($conexion, $tabla, $criterios);

                         $_SESSION["orden"]["FechaPrevista"] = "";
                         echo "se setea Equipo<br>";
			 $_SESSION["orden"]["Equipo"] = $_POST["equipo"];
			 
			 echo "se levanta de la BD informacion<br>";
			//armado de la sentencia SQL para cargar datos
			$tabla = "equipo";
			$campos = "cuotadiaslaborales, cuotasabado, cuotadomingo, cuotaferiado";
			$criterios = "codigodeequipo = '" . $_SESSION["orden"]["Equipo"] .  "'";
			echo "Criterio : $criterios <br>";
			echo "Campos : $campos <br>";
			echo "tabla : $tabla <br>"; 
			//Ejecuto la sentencia
			$tablars = consultarEnBD($conexion, $tabla, $campos, $criterios);
			// $cantElem = sizeof($tablars);



                        $diahoy = mktime(0, 0, 0, date("m")  , date("d")+ 0, date("Y"));
			$diahoys = "'" . date("Y", $diahoy) . "-" . date("m", $diahoy) . "-" . date("d", $diahoy) ."'";
                        $diaenunmes = mktime(0, 0, 0, date("m")  , date("d")+ 31, date("Y"));
			$diaenunmess = "'" . date("Y", $diaenunmes) . "-" . date("m", $diaenunmes) . "-" . date("d", $diaenunmes) ."'";


			 echo "se levanta de la BD informacion<br>";
			//armado de la sentencia SQL para cargar datos
			$tabla = "cuotaexcepcional";
			$campos = "fecha_aplicacion, cuota";
			$criterios = "(fecha_aplicacion BETWEEN " . $diahoys . " AND " . $diaenunmess . ") AND (Equipo = '" . $_SESSION["orden"]["Equipo"] . "')";
			echo "Criterio : $criterios <br>";
			echo "Campos : $campos <br>";
			echo "tabla : $tabla <br>"; 
			//Ejecuto la sentencia
			$tablarscex = consultarEnBD($conexion, $tabla, $campos, $criterios);


                        echo "tabla rs cex<br>";
                        print_r($tablarscex);
echo "<br>";
                        $cuotasExcepcionales = array();
                        foreach ($tablarscex as $registro) {
                           $cuotasExcepcionales[strtotime($registro['fecha_aplicacion'])]=$registro['cuota'];
                        }

                        echo "tabla cuotasExcepcionales<br>";
                        print_r($cuotasExcepcionales);
echo "<br>";
			// se carga en un vector de 31 posisiones las cuotas del equipo para el tipo de dia correspondiente en el vector
			$listaCuotas = array();
                        for ($i = 0; $i < 31; $i++){

                           $diaCelda = mktime(0, 0, 0, date("m")  , date("d")+ $i, date("Y"));
                           //$diaCeldaString = date_format('Y-m-d', $diaCelda);
//echo "dia celda string : " . $diaCeldaString . "<br>";


                           if (isset($cuotasExcepcionales[$diaCelda])){
                               echo "esta seteado tblarscex para dia celda : ". $diaCelda . "<br>";
                               $listaCuotas[] = $cuotasExcepcionales[$diaCelda]["cuota"];
                           }
                           else{
				echo " NO **** esta seteado tblarscex para dia selda : ". $diaCelda . "<br>";
				if(isset($feriados[$diaCelda]))
{
					$listaCuotas[] = $tablars[0]["cuotaferiado"];
echo "es feriado : " . $diaCelda . " cuota : " .  $tablars[0]["cuotaferiado"] . "<br>";
}
				else
					if (date('N', $diaCelda) == 7)
						$listaCuotas[] = $tablars[0]["cuotadomingo"];
					else
						if (date('N', $diaCelda) == 6)
							$listaCuotas[] = $tablars[0]["cuotasabado"];
						else
							$listaCuotas[] = $tablars[0]["cuotadiaslaborales"];
			   }
                        }
			$_SESSION["cuotas"] = $listaCuotas;
			echo "<br><br><br><br><br>";
			print_r($_SESSION["cuotas"]);
			echo "<br><br><br><br><br>";
			echo "se cargan las cantidades de ordens asignadas al equipo por día para un periodo de un mes<br>";



			 echo "se levanta de la BD informacion<br>";
			//armado de la sentencia SQL para cargar datos
                        $diahoy = mktime(0, 0, 0, date("m")  , date("d")+ 0, date("Y"));
			$diahoys = "'" . date("Y", $diahoy) . "-" . date("m", $diahoy) . "-" . date("d", $diahoy) ."'";
                        $diaenunmes = mktime(0, 0, 0, date("m")  , date("d")+ 31, date("Y"));
			$diaenunmess = "'" . date("Y", $diaenunmes) . "-" . date("m", $diaenunmes) . "-" . date("d", $diaenunmes) ."'";
			$tabla = "ordentrabajo";
			$campos = "FechaPrevista, COUNT(*) AS Ordenes";
			$criterios = "(FechaPrevista BETWEEN " . $diahoys . " AND " . $diaenunmess . ") AND (Equipo = '" . $_SESSION["orden"]["Equipo"] . "') GROUP BY FechaPrevista ORDER BY FechaPrevista";
			echo "Criterio : $criterios <br>";
			echo "Campos : $campos <br>";
			echo "tabla : $tabla <br>"; 
			//Ejecuto la sentencia
			$tablarsordenes = consultarEnBD($conexion, $tabla, $campos, $criterios);
			// $cantElem = sizeof($tablars);

			// se carga en un vector con las cantidades de ordenes asignadas al equipo en cada dia desde hoy hsta dentro de 31 dias
			$listaCantOrdenesAux = array();
			$cantElem = sizeof($tablarsordenes);
                        for ($i = 0; $i < $cantElem; $i++){
				$diafechastring = "'" . substr($tablarsordenes[$i]["FechaPrevista"],0,4) . "-" . substr($tablarsordenes[$i]["FechaPrevista"],5,2) . "-" . substr($tablarsordenes[$i]["FechaPrevista"],8,2) . "'";

				$listaCantOrdenesAux[$diafechastring] = $tablarsordenes[$i]["Ordenes"];	
			}
                        // ahora hay que cargar en un array de 31 posisiones las cantidades de ordenes.

			$listaCantOrdenes = array();
			for ($i = 0; $i < 31; $i++){ 
				$diaVector = mktime(0, 0, 0, date("m")  , date("d")+ $i, date("Y"));
               
				if (isset($listaCantOrdenesAux["'" . date("Y", $diaVector) . "-" . date("m", $diaVector) . "-" . date("d", $diaVector) . "'"]))
					$listaCantOrdenes [] = $listaCantOrdenesAux["'" . date("Y", $diaVector) . "-" . date("m", $diaVector) . "-" . date("d", $diaVector) ."'"];
				ELSE
					$listaCantOrdenes [] = "0";
			}
			$_SESSION["cuotasCubiertas"] = $listaCantOrdenes;
			echo "cuota cubierta :<br><br><br><br><br>";
			print_r($_SESSION["cuotasCubiertas"]);
			echo "<br><br><br><br><br>";

                   } else {
                           echo "Error: " . $sqlstr . "<br>" . mysql_error($conexion) . "<br>" . mysql_error($conexion) . "<br>";
                           $_SESSION["mensajePasado"] = "El equipo elejido esta siendo coordinado por otro usuario, espere a que lo libere o elija otro equipo";

                          }


		}

		$_SESSION["ver"] = $_POST["ver"];
		echo "Dias a visualizar : " . $_SESSION["ver"] . "<br>";

		if (isset($_POST["cancelar"])){
			echo "Cancelar<br>";
                         // se libera el bloqueo del equipo seleccionado si existe seleccion
                         $tabla = "equiposbloqueados";
                         $criterios = "equipo='" . $_SESSION["orden"]["Equipo"] . "'";
                         borrarEnBD($conexion, $tabla, $criterios);
			$scriptSiguiente = "GenerarOrdenDeTrabajoComercial.php";
		}
		else
		{
			// proceso de validacion

			$scriptSiguiente = "programacion.php";

			if (isset($_POST["confirmar"]))
			{
                             if ($_SESSION["orden"]["Equipo"] != "")
                                  if ($_SESSION["orden"]["FechaPrevista"] != "")
                                  {
                                      // se libera el bloqueo del equipo seleccionado anteriormente
                                      $tabla = "equiposbloqueados";
                                      $criterios = "equipo='" . $_SESSION["orden"]["Equipo"] . "'";
                                      borrarEnBD($conexion, $tabla, $criterios);

                                      $scriptSiguiente = "grabarorden.php";
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