<!DOCTYPE html>
<?php 
include ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");
?>
<html>
	<head>
		<title>Generación Orden de Trabajo</title>
	<head>
	<body>
		<div align="center">
		<div style="width:680px" align="left">
			<h1 align="center">TEVEO</h1>
			<h2 align="center">Orden de Trabajo <?php echo $_SESSION["orden"]["Numero"];?></h2>
            <br>
			<form name = "formulario" method = "post" action = "controladorAccionOTEquipos.php">
				<fieldset>
					<legend>Actualización Orden de Trabajo por pate del equipo</legend>
					<table >	
						<tr>
							<td nowrap>
								Equipo Actualización:
							</td>
							<td>
								<input type="text" name="equipo" value="<?php echo $_SESSION["identificadorequipo"];?>" disabled>
							</td>
						</tr>
						<tr>
							<td nowrap >
								Nuevo estado de la Orden de trabajo:
							</td>
							<td>
								<input type="text" name="sistemaGenerador" value="<?php echo $_SESSION["orden"]["Estado"];?>" disabled><br>
							</td>							
						</tr>						
					</table>  
					<br>
				</fieldset>	
				<br>
				<fieldset>
				<div>
					<table width="100%">
						<tr align="center">
							<td width="50%">
								<br>Comentarios de actualización:<br>
								<?php echo '<textarea name="comentarioequipo" rows="4" cols="42"></textarea>'; ?>
							</td>							
						</tr>
					</table>
				</div>
				<br>
				<div align="center">

					CONFIRMA LA ACTUALIZACIÓN ?
				<br><br><br>
					<input width="40px" type="submit" name="cancelar" value="   Volver   "><input width="40px" type="submit" name="confirmar" value="Actualizar">
				</div>
			</form>
		</div>
		</div>
	<body>
</html>