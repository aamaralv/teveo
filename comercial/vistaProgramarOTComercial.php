<!DOCTYPE html>
<?php 
include ("../seguridad/seguridad.php");
$_SESSION["paginaAnterior"] = "vistaProgramarOTComercial.php";
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
				<h2 align="center">Programación Orden de Trabajo</h2>
				<?php echo '<h1 style="color:#FF0000" align="center">' . $_SESSION["mensajePasado"] . '</h1>'; ?>
				<form name = "formularioProgramacion" method = "post" action = "controladorProgramarOTComercial.php">
					<br>
					<br>
					<br>
						<fieldset>
						<legend>Coordinación visita</legend>
						<div style="display: <?php if ($_SESSION["orden"]["Equipo"] == "") echo 'none'; else echo 'block';?>">
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
							Horario preferido: 	
							<input type="radio" name="horario" value="1" <?php if($_SESSION["orden"]["Horario"] == 1) echo "checked"; ?> onchange='this.form.submit()'>Mañana 
							<input type="radio" name="horario" value="2" <?php if($_SESSION["orden"]["Horario"] == 2) echo "checked"; ?> onchange='this.form.submit()'>Tarde
							<input type="radio" name="horario" value="3" <?php if($_SESSION["orden"]["Horario"] == 3) echo "checked"; ?> onchange='this.form.submit()'>Indistinto
							<br>
							<br>
							Comentario:<br>
							<textarea name="comentario" id="comentario_id" rows="2" cols="81"><?php echo $_SESSION["orden"]["Comentario"]; ?></textarea>
						</div>
					</fieldset>	
					<br>
					<fieldset>
						<legend>Equipos elegibles</legend>
						<div align="center">
							<br>
							Seleccione día previdto para la realizacion de la orden: 
							<br>
							<br>
							<table border='1'>
								<tr>
									<td>LUM</td><td>MAR</td><td>MIE</td><td>JUE</td><td>VIE</td><td>SAB</td><td>DOM</td>
								</tr>
								<?php
									$i = 0;
									for($f = 1; $f <= 6; $f++){
										echo "<tr>";
											for($c = 1; $c <= 7; $c++){
												echo "<td>";
													if ($_SESSION["numerosDiasCalendario"][$i] != "-")
														echo '<a href="controladorProgramarOTComercial.php?diaElegido=' . ($i + 1) . '">' . $_SESSION["numerosDiasCalendario"][$i] . '</a>';
													$i++;
												echo "</td>";
											}
										echo "</tr>";
									}
								?>
							</table>
							<br>
						</div>
					</fieldset>
					<br>
					<br>
					<div align="center">
						<input type="submit" name="confirmar" value="Confirmar"><input type="submit" name="cancelar" value="Cancelar">
					</div>
				</form>
			</div>
		</div>
	</body>
</html>		