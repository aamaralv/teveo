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
			<h3 align="center">Estado: <strong style="color:#00FF00"><?php echo $_SESSION["orden"]["Estado"];?></strong></h3>
			<div align="right">
				<table>
					<tr>
						<td>
						Fecha de Generación:</td><td> <?php echo $_SESSION["orden"]["FechaHoraCreacion"];?>
						<td>
						Usuario Generación:</td><td><?php echo $_SESSION["orden"]["UsuarioCreador"];?>
						</td>
					</tr>
				</table>
			</div>
			<form name = "formulario" method = "post" action = "controladorCancelarOTOperaciones.php">
				<fieldset>
					<legend>Origen</legend>
					<table >	
						<tr>
							<td nowrap>
								Tipo de orden:
							</td>
							<td>
								<input type="text" name="tipoOrden" value="<?php echo $_SESSION["orden"]["TipoOrden"];?>" disabled>
							</td>
							<td nowrap >
								Sistema generador:
							</td>
							<td>
								<input type="text" name="sistemaGenerador" value="<?php echo $_SESSION["orden"]["SistemaEmisor"];?>" disabled><br>
							</td>							
						</tr>						
						<tr>
							<td colspan="4">
							</td>
						</tr>
						<tr>
							<td>
								Tipo de tarea:
							</td>
							<td>
								<input type="text" name="tipotarea" value="<?php echo $_SESSION["orden"]["TipoTarea"];?>" disabled>
							</td>
							<td>
								Producto:
							</td>
							<td>
								<input type="text" name="tipoproducto" value="<?php echo $_SESSION["orden"]["TipoProducto"];?>" disabled>
							</td>
						</tr>
					</table>
					  
					<br>
					<fieldset>
						<legend>Habilidades requeridas para cumplir con la orden</legend>
						habilidad
							<?php							 
								$tablaHabilidades = obtenerListadoHabilidadesDescripcionPeso();
								$cantElem = sizeof($tablaHabilidades);
								for ($i = 0; $i < $cantElem; $i++)
								{
									if (is_int($_SESSION["orden"]["FuncionesRequeridas"] / $tablaHabilidades[$i]["peso"]))
										echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $tablaHabilidades[$i]["descripcion"] . " - " . $tablaHabilidades[$i]["peso"] . "<br>";
								}
								echo '<input type="hidden" name="habilidades" value="' . $_SESSION["orden"]["FuncionesRequeridas"] . '">';
							?>
					</fieldset>
				</fieldset>	
				<br>
				<fieldset>
					<legend>Cliente</legend>
						<table width="100%">
							<tr>
								<td>
									Nombre/s:
								</td>
								<td>
									<input type="text" name="nombre" value="<?php echo $_SESSION["orden"]["NombreCliente"];?>" disabled>
								</td>
								<td>
									Apellido/s
								</td>
								<td>
									<input type="text" name="apellido" value="<?php echo $_SESSION["orden"]["ApellidoCliente"];?>" disabled><br>
								</td>
							</tr>
							<tr>
								<td>
								Cédula de identidad
								</td>
								<td>
									<input type="text" name="ci" value="<?php echo $_SESSION["orden"]["Cedula"];?>" disabled><br>
								</td>
								<td>
								Télefono/Celular
								</td>
								<td>
									<input type="text" name="telefono" value="<?php echo $_SESSION["orden"]["Telefono"];?>" disabled><br>
								</td>
							</tr>
						</table>
						<br>
				</fieldset>	
					<br>
				<fieldset>
					<legend>Ubicación</legend>
					<table>
						<tr>
							<td width="20%">
								Departamento
							</td>
							<td width="30%">
								<input type="text" name="departamento" value="<?php echo $_SESSION["orden"]["Departamento"];?>" disabled>
							</td>
							<td width="20%">
								Localidad:
							</td>
							<td width="30%">
								<input type="text" name="localidad" value="<?php echo $_SESSION["orden"]["Localidad"];?>" disabled>	
							</td>
						</tr>
						<tr>
							<td colspan="4">
								Dirección:<textarea name="direccion" rows="2" cols="60"><?php echo $_SESSION["orden"]["Direccion"];?></textarea>
							</td>
						</tr>
					</table>
					<br>
				</fieldset>	
				<br>	
				<br>
				<div align="left">
					<hr>
					<?php
						if (strlen($_SESSION["mensajePasado"]) > 0) echo '<h2 align="center" ><strong style="color:#FF0000">' . $_SESSION["mensajePasado"] . '</strong></h2>';
					?>
					<div>
						<table style="width:100%; height:100%;">
							<tr>
								<td style="vertical-align:middle;">
									Comentarios Cierre :
								</td>
								<td>
									<?php echo '<textarea name="comentarioCierre" rows="4" cols="70"></textarea>'; ?>
								</td>
							</tr>
						</table>
					</div>
					<hr>
				</div>
				<div align="center">
					<input width="40px" type="submit" name="cancelar" value="  Volver  al  listado  "><input width="40px" type="submit" name="confirmar" value="Confirmar Anulación">
				</div>
			</form>
		</div>
		</div>
	<body>
</html>