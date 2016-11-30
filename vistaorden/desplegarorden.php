<!DOCTYPE html>
<?php 
include ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");
$_SESSION["mensajePasado"] = "salir";
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
				<table width="50%">
					<tr>
						<td>
						Fecha de Generación:</td><td> <?php echo $_SESSION["orden"]["FechaHoraCreacion"];?>
						</tr>
					<tr>
						<td>
						Usuario Generación:</td><td><?php echo $_SESSION["orden"]["UsuarioCreador"];?>
						</td>
					</tr>
				</table>
			</div>
			<form name = "formulario" method = "post" action = "controladorDesplegarOrden.php">
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
								<td width="22%">
									Nombre/s:
								</td>
								<td>
									<input type="text" name="nombre" value="<?php echo $_SESSION["orden"]["NombreCliente"];?>" disabled>
								</td>
								<td width="22%">
									Apellido/s
								</td>
								<td>
									<input type="text" name="apellido" value="<?php echo $_SESSION["orden"]["ApellidoCliente"];?>" disabled><br>
								</td>
							</tr>
							<tr>
								<td width="22%">
								Cédula de identidad
								</td>
								<td colspan="3">
									<input size="60" type="text" name="ci" value="<?php echo $_SESSION["orden"]["Cedula"];?>" disabled><br>
								</td>
							</tr>
							<tr>
								<td width="22%">
								Télefono/Celular
								</td>
								<td colspan="3">
									<input size="60" type="text" name="telefono" value="<?php echo $_SESSION["orden"]["Telefono"];?>" disabled><br>
								</td>
							</tr>
						</table>
						<br>
				</fieldset>	
					<br>
				<fieldset>
					<legend>Ubicació</legend>
					<table width="100%">
						<tr>
							<td width="22%">
								Departamento
							</td>
							<td width="52%">
								<input type="text" name="departamento" value="<?php echo $_SESSION["orden"]["Departamento"];?>" disabled>
							</td>
							<td rowspan="2" width="26%">
							Código de Zona:<br><input align="center"  size="11" type="text" name="codzona" value="<?php echo $_SESSION["orden"]["CodigoZona"];?>" disabled>
							</td>
						</tr>
						<tr>
							<td>
								Localidad:
							</td>
							<td>
								<input type="text" name="localidad" value="<?php echo $_SESSION["orden"]["Localidad"];?>" disabled>	
							</td>
							<td>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								Dirección:
							</td>
						</tr>
					</table>
					<textarea name="direccion" rows="2" cols="81"><?php echo $_SESSION["orden"]["Direccion"];?></textarea><br>
				</fieldset>	
				<br>
				<fieldset>
					<legend>Coordinación visita</legend>
					<div  style="display: <?php if ($_SESSION["orden"]["Prioridad"] == 0) echo 'none'; else echo 'block';?>">
						Prioridad:	
								<input type="radio" name="prioridad" value="1" <?php if($_SESSION["orden"]["Prioridad"] == 1) echo "checked"; ?>>1
								<input type="radio" name="prioridad" value="2" <?php if($_SESSION["orden"]["Prioridad"] == 2) echo "checked"; ?>>2
								<input type="radio" name="prioridad" value="3" <?php if($_SESSION["orden"]["Prioridad"] == 3) echo "checked"; ?>>3
					</div>
					<br>
					<div>
						<table width="100%">
							<tr>
								<td width="50%">
									Fecha prevista: <input type="text" name="fechaPrevista" value="<?php echo $_SESSION["orden"]["FechaPrevista"];?>" disabled> 
								</td>
								<td width="50%">
									Equipo previsto: <input type="text" name="equipo" value="<?php echo $_SESSION["orden"]["Equipo"];?>" disabled>
								</td>
							</tr>
						</table>
					</div>
					<br>
					<div>
						Horario preferido: 	<input type="radio" name="horario" value="1" <?php if($_SESSION["orden"]["Horario"] == 1) echo "checked"; ?>>Mañana 
											<input type="radio" name="horario" value="2" <?php if($_SESSION["orden"]["Horario"] == 2) echo "checked"; ?>>Tarde
											<input type="radio" name="horario" value="3" <?php if($_SESSION["orden"]["Horario"] == 3) echo "checked"; ?>>Indistinto
						<br>
						<br>
						Comentario:<br>
						<?php echo '<textarea name="comentarioHorario" rows="4" cols="84">' . $_SESSION["orden"]["Comentario"] . '</textarea>'; ?>
					</div>
				</fieldset>	
				<br>
				<div align="left">
				<hr>
					<table width="100%">
						<tr>
							<td width="50%">
								Supervisor:<?php echo $_SESSION["orden"]["IdentificadorSupervisor"];?> &nbsp;&nbsp;-&nbsp;&nbsp; <?php echo $_SESSION["orden"]["FechaHoraDespacho"];?>
								<br>
								<br>Comentarios Supervisor:<br>
								<?php echo '<textarea name="comentarioSupervisor" rows="4" cols="42">' . $_SESSION["orden"]["ComentariosSupervisor"] . '</textarea>'; ?>
							</td>
							<td width="50%">
								Equipo:<?php echo $_SESSION["orden"]["Equipo"];?> &nbsp;&nbsp;-&nbsp;&nbsp; __ / __ / ____
								<br>
								<br>Comentarios Equipo:<br>
								<?php echo '<textarea name="comentarioEquipo" rows="4" cols="42">' . $_SESSION["orden"]["ComentariosEquipo"] . '</textarea>'; ?>
							</td>							
						</tr>
					</table>
					<div>
	    <table style="width:100%; height:100%;">
			<tr>
				<td style="vertical-align:middle;">
					Comentarios Cierre :
				</td>
				<td>
					<?php echo '<textarea name="comentarioCierre" rows="4" cols="70">' . $_SESSION["orden"]["ComentariosCierre"] . '</textarea>'; ?>
				</td>
			</tr>
		</table>
						

					</div>
					<hr>
				</div>
				<div align="center">
					<input type="submit" name="cerrar" value="Cerrar">
				</div>
			</form>
		</div>
		</div>
	<body>
</html>