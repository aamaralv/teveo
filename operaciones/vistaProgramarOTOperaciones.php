<!DOCTYPE html>
<?php 
include ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");
$dias = array('','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo');
$meses = array('', 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Setiembre', 'Octubre', 'Noviembre', 'Diciembre',);
?> 
<html>
	<head>
		<title>Programación Orden de Trabajo</title>
	<head>
	<body>
		<div align="center">
			<div style="width:680px" align="left">
				<h1 align="center">TEVEO</h1>
				<h2 align="center">Programación Orden de Trabajo<?php echo " - " . $_SESSION["orden"]["Numero"] .  " - " ; ?></h2>
 
				<?php echo '<h1 style="color:#5F9EA0" align="center">' . $_SESSION["mensajePasado"] . '</h1>'; ?>
				<form name = "formularioProgramacion" method = "post" action = "controladorProgramarOTOperaciones.php">
				<br>
				<br>
				<br>
				<fieldset>
					<legend>Coordinación visita</legend>
					<?php 
						if ($_SESSION["orden"]["Equipo"] == "")
							echo '<div style="display: none">';
						else
							echo '<div style="display: block">';
					?>
						<table width="100%">
							<tr>
								<td width="50%">
									Fecha prevista:  <input type="text" name="fechaPrevista" value="<?php echo $_SESSION["orden"]["FechaPrevista"] ?>" placeholder="        __ / __ / ____ " disabled> 
								</td>
								<td width="50%">
									Equipo previsto: <input type="text" name="equipo" value="<?php echo $_SESSION["orden"]["Equipo"] ?>" disabled>
								</td>
							</tr>
						</table>
					</div>
					<br>
					<div>
						Horario preferido: 	<input type="radio" name="horario" value="1" <?php if($_SESSION["orden"]["Horario"] == 1) echo "checked"; ?> onchange='this.form.submit()'>Mañana 
									<input type="radio" name="horario" value="2" <?php if($_SESSION["orden"]["Horario"] == 2) echo "checked"; ?> onchange='this.form.submit()'>Tarde
									<input type="radio" name="horario" value="3" <?php if($_SESSION["orden"]["Horario"] == 3) echo "checked"; ?> onchange='this.form.submit()'>Indistinto
						<br>
						<br>
						Comentario:<br>
						<textarea name="comentario" rows="2" cols="81"><?php echo $_SESSION["orden"]["Comentario"]; ?></textarea>
					</div>
				</fieldset>	
				<br>
 
				<fieldset>
					<legend>Equipos elegibles</legend>
 
<div align="center">
<br>
			Equipo: 
 
<?php
 
							$cantElem = sizeof($_SESSION["listaEquipos"]);
                                                        echo "<select name = 'equipo' onchange='this.form.submit()'>";
                                                        if ($_SESSION["orden"]["Equipo"] == "")
                                                            echo '<option value = "">Elija equipo</option>';
							for ($i = 0; $i < $cantElem; $i++)
							{
                                                                 echo "<option value = " . $_SESSION["listaEquipos"][$i];
                                                                 if ($_SESSION["orden"]["Equipo"] == $_SESSION["listaEquipos"][$i])
                                                                     echo " selected";
                                                                 echo ">" . $_SESSION["listaEquipos"][$i] . "</option>";
 
							}
                                                        echo "</select>";
 
?>
 
<br><br>
</div>
 
 
				</fieldset>
                                <br>
<div <?php if(strlen($_SESSION["orden"]["Equipo"]) =="") echo 'style="display: none;"'; else echo 'style="display: block;"';?>>
				<fieldset>
					<legend>Calendario del equipo</legend>
					<br>Ver: <input type="radio" name="ver" value="1" <?php if($_SESSION["ver"] == 1) echo 'checked="checked"';?> onchange='this.form.submit()'>un día
					         <input type="radio" name="ver" value="7" <?php if($_SESSION["ver"] == 7) echo 'checked="checked"';?> onchange='this.form.submit()'>7 dias
						 <input type="radio" name="ver" value="31" <?php if($_SESSION["ver"] == 31) echo 'checked="checked"';?> onchange='this.form.submit()'>un mes
					<br><br>
<?php
 
$fechaDia = $dias[date('N')];
$fechaMes = $meses[intval(date("m"))];
 
echo "Hoy es: " . $fechaDia . date("d") . " de " . $fechaMes .  " de "  .  date("Y") ."<br>";
?>
 
<!-- *********************************************  despliegue de un solo dia  ********************************************* --> 
<div <?php if($_SESSION["ver"] == 1) echo 'style="display: block;"'; else echo 'style="display: none;"'; ?>>
	<br>
	<div align="center">
		Ingrese fecha a mostrar 
<?php
 
 
                                                        echo "<select name = 'diaUnico' onchange='this.form.submit()'>";
                                                        if ($_SESSION["orden"]["FechaPrevista"] == "")
                                                            echo '<option value = "1000">Elija una fecha</option>';
							    for ($i = 0; $i < 31; $i++)
							    {
                                                              if ($_SESSION["cuotas"][$i] > $_SESSION["cuotasCubiertas"][$i])
                                                              {
                                                                echo "<option value = " . $i;
 
                                                                $diaCelda = mktime(0, 0, 0, date("m")  , date("d")+ $i, date("Y"));                 
                                                                $fechaComparacion = date("d", $diaCelda) . " / " . date("m", $diaCelda) . " / " . date("Y", $diaCelda);
                                                                $a = date("Y", $diaCelda);
                                                                $d = date("d", $diaCelda);
                                                                $m = date("m", $diaCelda);
                                                                $dd = substr($_SESSION["orden"]["FechaPrevista"],0,2);
                                                                $mm = substr($_SESSION["orden"]["FechaPrevista"],5,2);
                                                                $aa = substr($_SESSION["orden"]["FechaPrevista"],10,4);

                                                                if (($a == $aa) && ($m == $mm) && ($d == $dd))
                                                                     echo " selected";
                                                                 echo ">";
 
 
								echo $dias[date('N', $diaCelda)] . " " . date("d", $diaCelda) . " de " . $meses[intval(date("m", $diaCelda))] . " de " . date("Y", $diaCelda);
								echo "</option>";
 
 
                                                              }
                                                           }
                                                        echo "</select>";
 
echo "<br><br>";
?>
 
<div align="center">
	<table border='1'>
		<tr>
			<td>Cuota asignada para el día</td>
			<td><?php echo $_SESSION["cuotas"][$_SESSION["desplazamiento"]]; ?></td>
		</tr>
		<tr>
			<td># de ordenes ya asignadas</td>
			<td>
				<?php echo $_SESSION["cuotasCubiertas"][$_SESSION["desplazamiento"]];
                                 if ($_SESSION["cuotas"][$_SESSION["desplazamiento"]] > $_SESSION["cuotasCubiertas"][$_SESSION["desplazamiento"]]) echo '<br><a href="controladorProgramarOTOperaciones.php?diaElegido=' . $_SESSION["desplazamiento"] . '">Elegir</a>';
                                ?>
			</td>
		</tr>
	</table>
</div>
 
		<br>
	</div>
</div>
 
<!-- ***********************************************  despliegue de 7 dia  ************************************************ -->
 
<?php if($_SESSION["ver"] == 7) echo '<div style="display: block;">'; else echo '<div style="display: none;">';

	echo "<table border='1'>";
	echo "<tr>";
	echo "<td></td>";
        $diaX = 0;
	for ($c1 = 0 ; $c1 < 7; $c1++){
		echo "<td>";        
		$diaCelda = mktime(0, 0, 0, date("m")  , date("d")+ $diaX, date("Y"));
		echo $dias[date('N', $diaCelda)] ."-" . date("d", $diaCelda) . "<br>" . substr($meses[intval(date("m", $diaCelda))],0,3) . "/" . date("Y", $diaCelda);
		echo "</td>";
                $diaX++;
	}
	echo "</tr>";
	echo "<tr>";
	echo "<td>Cuota</td>";
	for ($c2 = 0; $c2 < 7; $c2++){
		echo "<td>";
                echo $_SESSION["cuotas"][$c2];
		echo "</td>";
	}
	echo "</tr>";
	echo "<tr>";
	echo "<td> # ordenes ya<br>asignadas</td>";
	for ($c3 = 0; $c3 < 7; $c3++){
		echo '<td>' . $_SESSION["cuotasCubiertas"][$c3];
                if ($_SESSION["cuotas"][$c3] > $_SESSION["cuotasCubiertas"][$c3]) echo '<br><a href="controladorProgramarOTOperaciones.php?diaElegido=' . $c3 . '">Elegir</a>';
		echo "</td>";
	}
	echo "</tr>";
 
	echo "</table><br>";
echo "</div>";
?>
<!-- ***********************************************  despliegue de 31 dia  ************************************************ -->
<?php if($_SESSION["ver"] == 31) echo '<div style="display: block;">'; else echo '<div style="display: none;">';
	echo "<table border='1'>";
    $diaX = 0;
	$diaCuota = 0;
	$dialink = 0;
	for($t =  0; $t < 4; $t++)
	{
		echo "<tr>";
		echo "<td></td>";
		// fila con dia y la fecha
		for ($c1 = 0 ; $c1 < 7; $c1++)
		{
			echo "<td>";        
			$diaCelda = mktime(0, 0, 0, date("m")  , date("d")+ $diaX, date("Y"));
			echo $dias[date('N', $diaCelda)] ."-" . date("d", $diaCelda) . "<br>" . substr($meses[intval(date("m", $diaCelda))],0,3) . "/" . date("Y", $diaCelda);
			echo "</td>";
			$diaX++;
		}
		// fila con las cuotas asignadas diarias
		echo "</tr>";
		echo "<tr>";
		echo "<td>Cuota</td>";
		for ($c2 = 0; $c2 < 7; $c2++)
		{
			echo '<td align="center" valign="middle">';
			echo $_SESSION["cuotas"][$diaCuota];
			echo "</td>";
			$diaCuota++;
		}
		// fila con la cantidad de ordenes en cada dia
		echo "</tr>";
		echo "<tr>";
		echo "<td> # ordenes ya<br>asignadas</td>";
		for ($c3 = 0; $c3 < 7; $c3++)
		{
			echo '<td>' . $_SESSION["cuotasCubiertas"][$dialink];
			if ($_SESSION["cuotas"][$dialink] > $_SESSION["cuotasCubiertas"][$dialink]) echo '<br><a href="controladorProgramarOTOperaciones.php?diaElegido=' . $dialink . '">Elegir</a>';
			echo "</td>";
			$dialink++;
		}
		echo "</tr>";
	}
// se grafican las 3 celdas restantes
	echo "<tr>";
	echo "<td></td>";
	for ($c1 = 0 ; $c1 < 3; $c1++)
	{
		echo "<td>";        
		$diaCelda = mktime(0, 0, 0, date("m")  , date("d")+ $diaX, date("Y"));
		echo $dias[date('N', $diaCelda)] ."-" . date("d", $diaCelda) . "<br>" . substr($meses[intval(date("m", $diaCelda))],0,3) . "/" . date("Y", $diaCelda);
		echo "</td>";
        $diaX++;
	}
    echo '<td colspan="4">';	
    echo "</td>";
	echo "</tr>";
	echo "<tr>";
	echo "<td>Cuota</td>";
	for ($c2 = 0; $c2 < 3; $c2++)
	{
		echo '<td align="center" valign="middle">';
		echo $_SESSION["cuotas"][$diaCuota];
		echo "</td>";
		$diaCuota++;
	}
    echo '<td colspan="4">';	
    echo "</td>";
	echo "</tr>";
	echo "<tr>";
	echo "<td> # ordenes ya<br>asignadas</td>";
	for ($c3 = 0; $c3 < 3; $c3++)
	{
		echo '<td>' . $_SESSION["cuotasCubiertas"][$dialink];
        if ($_SESSION["cuotas"][$dialink] > $_SESSION["cuotasCubiertas"][$dialink]) echo '<br><a href="controladorProgramarOTOperaciones.php?diaElegido=' . $dialink . '">Elegir</a>';
		echo "</td>";
		$dialink++;
	}
    echo '<td colspan="4">';	
    echo "</td>";
	echo "</tr>";
	echo "</table><br>";
	echo "</div>";
?>
</div>
					<br>
</div>
				</fieldset>
 
				<br>
				<div align="center">
					<input type="submit" name="confirmar" value="Confirmar"><input type="submit" name="cancelar" value="Cancelar">
				</div>
</form>
			</div>
		</div>
	</body>
</html>