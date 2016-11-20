<!DOCTYPE html>
<?php 
include ("../seguridad/seguridad.php");
include ("../persistencia/conexion.php");
include ("../persistencia/funcionesBD.php");
//conecto con la base de datos
$conexion = conectarBD($bdhost, $bduser, $bdpass);						 
//selecciono la BBDD
establecerBD($conexion, $bdbase);
?> 
<html>
	<head>
		<title>Generación Orden de Trabajo</title>
	<head>
	<body>
		<div align="center">
		<div style="width:680px" align="left">
			<h1 align="center">TEVEO</h1>
			<h2 align="center">Generación Orden de Trabajo</h2>
                      
                        <?php echo '<h1 style="color:#5F9EA0" align="center">' . $_SESSION["mensajePasado"] . '</h1>'; ?>

			<br>			
			<form name = "formulario" method = "post" action = "accion.php">
				<fieldset>
					<legend>Origen</legend>
					<table >	
						<tr>
							<td nowrap>
								Tipo de orden:
							</td>
							<td>
                                                            <input type="text" name="tipoOrden" value="<?php echo  obtenerDescripcionTipoOrden($conexion, $_SESSION["orden"]["TipoOrden"]); ?>" disabled>                               
							</td>
							<td nowrap >
								Sistema generador:
							</td>
							<td>
								<input type="text" name="sistemaGenerador" value="<?php echo  obtenerDescripcionSistemaGenerador($conexion, $_SESSION["orden"]["SistemaEmisor"]); ?>" disabled><br>
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
								<input type="text" name="tipoTarea" value="<?php echo  obtenerDescripcionTipoTarea($conexion, $_SESSION["orden"]["TipoTarea"]); ?>" disabled>
							</td>
							<td>
								Producto:
							</td>
							<td>
						<?php
							 
							//armado de la sentencia SQL para cargar datos
							$tabla = "tipoproducto";
							$campos = "codigo, descripcion, habilidad";
							$criterios = "accion = 'instalar'";
							
							//Ejecuto la sentencia
							$tablars = consultarEnBD($conexion, $tabla, $campos, $criterios);

							$cantElem = sizeof($tablars);
                                                        echo "<select name = 'producto' onchange='this.form.submit()'>";
                                                        if ($_SESSION["orden"]["TipoProducto"] == "")
                                                            echo '<option value = "">Elija un producto</option>';
							for ($i = 0; $i < $cantElem; $i++)
							{
                                                                 echo "<option value = " . $tablars[$i]["codigo"];
                                                                 if ($_SESSION["orden"]["TipoProducto"] == $tablars[$i]["codigo"])
                                                                     echo " selected";
                                                                 echo ">" . $tablars[$i]["descripcion"] . "</option>";

							}
                                                        echo "</select>";
						
						?>



							</td>
						</tr>
					</table>
					  
					<br>
					<fieldset>
						<legend>Habilidades requeridas para cumplir con la orden</legend>
						<?php							 
							//armado de la sentencia SQL para buscar un usuario con esos datos
							$tabla = "habilidad";
							$campos = "descripcion, peso";
							$criterios = "1";
							
							//Ejecuto la sentencia
							$tablars = consultarEnBD($conexion, $tabla, $campos, $criterios);

							$cantElem = sizeof($tablars);
							for ($i = 0; $i < $cantElem; $i++)
							{
                                                             if (is_int($_SESSION["orden"]["FuncionesRequeridas"] / $tablars[$i]["peso"]))
							         echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $tablars[$i]["descripcion"] . " - " . $tablars[$i]["peso"] . "<br>";

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
									<input type="text" name="nombre" value="<?php echo $_SESSION["orden"]["NombreCliente"]; ?>" placeholder="Nombre/s">
								</td>
								<td width="22%">
									Apellido/s
								</td>
								<td>
									<input type="text" name="apellido" value="<?php echo $_SESSION["orden"]["ApellidoCliente"]; ?>" placeholder="Apellido/s" autofocus><br>
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
				<fieldset>
					<legend>Ubicació</legend>
					<table width="100%">
						<tr>
							<td width="22%">
								Departamento
							</td>
							<td width="52%">



<?php
							//armado de la sentencia SQL para cargar datos
							$tabla = "departamento";
							$campos = "id, NombreDepto";
							$criterios = "1";
							
							//Ejecuto la sentencia
							$tablars = consultarEnBD($conexion, $tabla, $campos, $criterios);

							$cantElem = sizeof($tablars);
                                                        echo "<select name = 'departamento' onchange='this.form.submit()'>";
                                                        if ($_SESSION["orden"]["Departamento"] == "")
                                                            echo '<option value = "">Elija departamento</option>';
							for ($i = 0; $i < $cantElem; $i++)
							{
                                                                 echo "<option value = " . $tablars[$i]["id"];
                                                                 if ($_SESSION["orden"]["Departamento"] == $tablars[$i]["id"])
                                                                     echo " selected";
                                                                 echo ">" . $tablars[$i]["NombreDepto"] . "</option>";

							}
                                                        echo "</select>". " - " . $_SESSION["orden"]["Departamento"];
						?>

							</td>
							<td rowspan="2" width="26%"></td>
						</tr>
						<tr>
							<td>
								Localidad:
							</td>
							<td>

<?php
	//armado de la sentencia SQL para cargar datos
	$tabla = "localidad";
	$campos = "id, idDepartamento, NombreLocalidad";
	$criterios = "idDepartamento = '" . $_SESSION["orden"]["Departamento"] . "'";

	//Ejecuto la sentencia
	$tablarsloc = consultarEnBD($conexion, $tabla, $campos, $criterios);

	$cantElem = sizeof($tablarsloc);
	$codigoLocalidadEnSesion = $_SESSION["orden"]["Localidad"];
	echo "<select name = 'localidad' onchange='this.form.submit()'>";
	if ($_SESSION["orden"]["Localidad"] == "")
	{
	    echo '<option value = "" selected>Elija localidad</option>';
	    for ($i = 0; $i < $cantElem; $i++)
		echo "<option value = " . $tablarsloc[$i]["id"] . ">" . $tablarsloc[$i]["NombreLocalidad"] . "</option>";
	}
	else
	{
	    $campoLocNom = "NombreLocalidad";
	    $criterioLoc = "id = '" . $_SESSION["orden"]["Localidad"] . "'";
	    $rsnombreloc =  consultarEnBD($conexion, $tabla, $campoLocNom, $criterioLoc);

	    $nombreLoc = $rsnombreloc[0]["NombreLocalidad"];
	    echo '<option value = "' . $codigoLocalidadEnSesion . '" selected>' . $nombreLoc . '</option>';
	    for ($i = 0; $i < $cantElem; $i++)
		    echo "<option value = " . $tablarsloc[$i]["id"] . ">" . $tablarsloc[$i]["NombreLocalidad"] . "</option>";
	}
	echo "</select>" . " - " . $_SESSION["orden"]["Localidad"];
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