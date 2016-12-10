<!DOCTYPE html>
<?php 
include_once ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");
?> 
<html>
	<head>
	<title>Generación Orden de Trabajo para Reclamo</title>
	<head>
	<body>
		<div align="center">
			<div style="width:680px" align="left">
				<h1 align="center">TEVEO</h1>
				<h2 align="center">Generación Orden de Trabajo para Reclamo</h2>      
				<h1 style="color:#FF0000" align="center"><?php echo $_SESSION["mensajePasado"]; ?></h1>
				<br>			
				<form name = "formulario" method = "post" action = "controladorGeneraOTSoporte.php">
					<fieldset>
						<legend>Origen</legend>
						<table >	
							<tr>
								<td nowrap>
									Tipo de orden:
								</td>
								<td>
									<input type="text" name="tipoOrden" value="<?php echo obtenerDescripcionTipoOrden($_SESSION["orden"]["TipoOrden"]); ?>" disabled>                               
								</td>
								<td nowrap >
									Sistema generador:
								</td>
								<td>
									<input type="text" name="sistemaGenerador" value="<?php echo  obtenerDescripcionSistemaGenerador($_SESSION["orden"]["SistemaEmisor"]); ?>" disabled><br>
								</td>							
							</tr>						
							<tr><td colspan="4"></td>
							</tr>
							<tr>
								<td>
									Tipo de tarea:
								</td>
								<td> 

								
								
								
								<!--   despliegue de la lista de seleccion para elegir la tarea de la orden de trabajo   -->
								<!-- =================================================================================== -->
								<?php
									$tablaTiposTarea = obtenerListaTareas();
									$cantElem = sizeof($tablaTiposTarea);
									echo "<select name = 'tarea' onchange='this.form.submit()'>";
									if ($_SESSION["orden"]["TipoTarea"] == "")
										echo '<option value = "">Elija una tarea</option>';
									for ($i = 0; $i < $cantElem; $i++)
									{
										echo "<option value = " . $tablaTiposTarea[$i]["codigo"];
										if ($_SESSION["orden"]["TipoTarea"] == $tablaTiposTarea[$i]["codigo"])
											echo " selected";
										echo ">" . $tablaTiposTarea[$i]["descripcion"] . "</option>";
									}
									echo "</select>";
								?>
								<!-- FIN despliegue de la lista de seleccion para elegir la tarea de la orden de trabajo -->
								<!-- =================================================================================== -->								
								
								
								
								
								</td>
								<td>
									Producto:
								</td>
								<td>
								<!-- despliegue de la lista de seleccion para elegir el producto de la orden de trabajo -->
								<!-- ================================================================================== -->
								<?php
									$tablaTiposProductos = obtenerListaProductosXAccion('instalar');
									$cantElem = sizeof($tablaTiposProductos);
									echo "<select name = 'producto' onchange='this.form.submit()'>";
									if ($_SESSION["orden"]["TipoProducto"] == "")
										echo '<option value = "">Elija un producto</option>';
									for ($i = 0; $i < $cantElem; $i++)
									{
										echo "<option value = " . $tablaTiposProductos[$i]["codigo"];
										if ($_SESSION["orden"]["TipoProducto"] == $tablaTiposProductos[$i]["codigo"])
											echo " selected";
										echo ">" . $tablaTiposProductos[$i]["descripcion"] . "</option>";
									}
									echo "</select>";
								?>
								</td>
							</tr>
						</table>

						<br>
						<fieldset>
							<legend>Habilidades requeridas para cumplir con la orden</legend>
							<!-- dependiendo del producto elegido para instalar se muestran las habilidades requeridas -->
							<!-- ===================================================================================== -->
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
					<!-- codigo para el ingreso de los datos del cliente -->
					<!-- =============================================== -->	
					<fieldset>
						<legend>Cliente</legend>
							<table width="100%">
								<tr>
									<td width="22%">
										Nombre/s:
									</td>
									<td>
										<input type="text" name="nombre" value="<?php echo $_SESSION["orden"]["NombreCliente"]; ?>" placeholder="Nombre/s">
									</td>
									<td width="22%">
										Apellido/s
									</td>
									<td>
										<input type="text" name="apellido" value="<?php echo $_SESSION["orden"]["ApellidoCliente"]; ?>" placeholder="Apellido/s"><br>
									</td>
								</tr>
								<tr>
									<td width="22%">
									Cédula de identidad
									</td>
									<td colspan="3">
										<input size="60" type="text" name="ci" value="<?php echo $_SESSION["orden"]["Cedula"]; ?>" placeholder="nro de cedula de identidad"><br>
									</td>
								</tr>
								<tr>
									<td width="22%">
									Télefono/Celular
									</td>
									<td colspan="3">
										<input size="60" type="text" name="telefono" value="<?php echo $_SESSION["orden"]["Telefono"]; ?>" placeholder="nro de telefono/celular"><br>
									</td>
								</tr>
							</table>
							<br>
					</fieldset>
					<br>
					<!-- codigo para el ingreso del la ubicacion geografica -->
					<!-- ================================================== --> 
					<fieldset>
						<legend>Ubicació</legend>
						<table width="100%">
							<!-- ================================================= D E P A R T A M E N T O =========================================== -->
							<tr>
								<td width="22%">
									Departamento
								</td>
								<td width="52%">
								<?php
									$tablaDepartamentos = obtenerListaDepartamentos();
									$cantElem = sizeof($tablaDepartamentos);
									echo "<select name = 'departamento' onchange='this.form.submit()'>";
									if ($_SESSION["orden"]["Departamento"] == "")
										echo '<option value = "">Elija departamento</option>';
									for ($i = 0; $i < $cantElem; $i++)
									{
										echo "<option value = " . $tablaDepartamentos[$i]["id"];
										if ($_SESSION["orden"]["Departamento"] == $tablaDepartamentos[$i]["id"])
											echo " selected";
										echo ">" . $tablaDepartamentos[$i]["nombre_depto"] . "</option>";
									}
									echo "</select>";
								?>
								</td>
								<td rowspan="2" width="26%"></td>
							</tr>
							<!-- ================================================= L O C A L I D A D ================================================= -->
							<tr>
								<td>
									Localidad:
								</td>
								<td>
								<?php
									$tablaLocalidades = obtenerListaLocalidades($_SESSION["orden"]["Departamento"]);
									$cantElem = sizeof($tablaLocalidades);
									$codigoLocalidadEnSesion = $_SESSION["orden"]["Localidad"];
									echo "<select name = 'localidad' onchange='this.form.submit()'>";
									if ($_SESSION["orden"]["Localidad"] == "")
									{
										echo '<option value = "" selected>Elija localidad</option>';
										for ($i = 0; $i < $cantElem; $i++)
										echo "<option value = " . $tablaLocalidades[$i]["id"] . ">" . $tablaLocalidades[$i]["nombre"] . "</option>";
									}
									else
									{ 
										$nombreLoc = obtenerNombreLocalidad($_SESSION["orden"]["Localidad"]);
										echo '<option value = "' . $codigoLocalidadEnSesion . '" selected>' . $nombreLoc . '</option>';
										for ($i = 0; $i < $cantElem; $i++)
											echo "<option value = " . $tablaLocalidades[$i]["id"] . ">" . $tablaLocalidades[$i]["nombre"] . "</option>";
									}
									echo "</select>";
								?>
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
						<textarea name="direccion" rows="2" cols="81"><?php echo $_SESSION["orden"]["Direccion"]; ?></textarea><br>
					</fieldset>	 
					<br>
					<br>
					<div align="center">
					<input type="submit" name="confirmar" value="Confirmar"><input type="submit" name="cancelar" value="Cancelar">
					</div>
				</form>
			</div>
		</div>
	<body>
</html>						