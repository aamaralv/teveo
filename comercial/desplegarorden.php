<!DOCTYPE html>
<?php 
include ("../seguridad/seguridad.php");
include ("../persistencia/conexion.php");
include ("../persistencia/funcionesBD.php");
//conecto con la base de datos
$conexion = conectarBD($bdhost, $bduser, $bdpass);						 
//selecciono la BBDD
establecerBD($conexion, $bdbase);

$_SESSION["mensajePasado"] = "";
?>
<html>
	<head>
		<title>Generación Orden de Trabajo</title>
	<head>
	<body>
		<div align="center">
		<div style="width:680px" align="left">
			<h1 align="center">TEVEO</h1>
			<h2 align="center">Orden de Trabajo Generada NNNNNN</h2>
			<h3 align="center">Estado: ESTADO</h3>
			<div align="right">
				<table width="40%">
					<tr>
						<td>
						Fecha de Generación:</td><td>__ / __ / ____
						</tr>
					<tr>
						<td>
						Usuario Generación:</td><td>---------------
						</td>
					</tr>
				</table>
			</div>
			<form name = "formulario" method = "post" action = "accion.php">
				<fieldset>
					<legend>Origen</legend>
					<table >	
						<tr>
							<td nowrap>
								Tipo de orden:
							</td>
							<td>
								<input type="text" name="tipoOrden" value="Instalacion" disabled>
							</td>
							<td nowrap >
								Sistema generador:
							</td>
							<td>
								<input type="text" name="sistemaGenerador" value="Comercial" disabled><br>
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
								<input type="text" name="tipotarea" value="Instalar" disabled>
							</td>
							<td>
								Producto:
							</td>
							<td>
								<input type="text" name="tipoproducto" value="" disabled>
							</td>
						</tr>
					</table>
					  
					<br>
					<fieldset>
						<legend>Habilidades requeridas para cumplir con la orden</legend>
						habilidad
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
									<input type="text" name="nombre" value="" disabled>
								</td>
								<td width="22%">
									Apellido/s
								</td>
								<td>
									<input type="text" name="apellido" value="" disabled><br>
								</td>
							</tr>
							<tr>
								<td width="22%">
								Cédula de identidad
								</td>
								<td colspan="3">
									<input size="60" type="text" name="ci" value="" disabled><br>
								</td>
							</tr>
							<tr>
								<td width="22%">
								Télefono/Celular
								</td>
								<td colspan="3">
									<input size="60" type="text" name="telefono" value="" disabled><br>
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
								<input type="text" name="departamento" value="" disabled>
							</td>
							<td rowspan="2" width="26%">
							Código de Zona:<br><input align="center"  size="11" type="text" name="codzona" value="" disabled>
							</td>
						</tr>
						<tr>
							<td>
								Localidad:
							</td>
							<td>
								<input type="text" name="localidad" value="" disabled>	
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
					<textarea name="direccion" rows="2" cols="81"></textarea><br>
				</fieldset>	
				<br>
				<fieldset>
					<legend>Coordinación visita</legend>
					<div>
						Prioridad:	
								<input type="radio" name="prioridad" value="1">1
								<input type="radio" name="prioridad" value="2">2
								<input type="radio" name="prioridad" value="3">3
					</div>
					<br>
					<div>
						<table width="100%">
							<tr>
								<td width="50%">
									Fecha prevista: <input type="text" name="fechaPrevista" value="" disabled> 
								</td>
								<td width="50%">
									Equipo previsto: <input type="text" name="equipo" value="" disabled>
								</td>
							</tr>
						</table>
					</div>
					<br>
					<div>
						Horario preferido: 	<input type="radio" name="horario" value="1">Mañana 
											<input type="radio" name="horario" value="2">Tarde
											<input type="radio" name="horario" value="3">Indistinto
						<br>
						<br>
						Comentario:<br>
						<textarea name="comentarioHorario" rows="2" cols="81"></textarea>
					</div>
				</fieldset>	
				<br>
				<div align="left">
				<hr>
					<table width="100%">
						<tr>
							<td width="50%">
								Supervisor:--------------- &nbsp;&nbsp;-&nbsp;&nbsp; __ / __ / ____
								<br>
								<br>Comentarios:<br>
								<textarea name="comentarioHorario" rows="4" cols="42"></textarea>
							</td>
							<td width="50%">
								Equipo:--------------- &nbsp;&nbsp;-&nbsp;&nbsp; __ / __ / ____
								<br>
								<br>Comentarios:<br>
								<textarea name="comentarioHorario" rows="4" cols="42"></textarea>
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
					<textarea name="comentarioHorario" rows="2" cols="70"></textarea>
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