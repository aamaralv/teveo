<!DOCTYPE html>
<?php 
include_once ("../seguridad/seguridad.php");
include_once ("../persistencia/ordendetrabajo.php");
echo sizeof($_SESSION["listadoOrdenes"]) . "<br>";
$_SESSION["scriptSiguiente"] = "../equipos/controladorGestionOTEquipos.php";
?> 
<html>
	<head>
	<style type="text/css">
		table { background-color:#eee;border-collapse:collapse; }
		th { background-color:#000;color:white;width:50%; }
		td, .myTable th { padding:5px;border:1px solid #000; }
	</style>
	<title>Listado Ordenes de Trabajo</title>
	<head>
	<body>
		<div align="center">
			<div style="width:1000px" align="left">
				<h1 align="center">TEVEO</h1>
				<h2 align="center">Listado de Ordenes de Trabajo</h2>      
				<h1 style="color:#FF0000" align="center"><?php echo $_SESSION["mensajePasado"]; ?></h1>
				Tecnico : <?php  echo $_SESSION["nombre"] . " " . $_SESSION["apellido"] . "<br> Codigo Equipo : " . $_SESSION["identificadorequipo"]; ?>
				<br>			
				<form name = "formulario" method = "post" action = "controladorGestionOTEquipos.php">
					<div align="center">
						Filtro : 
						<select name = 'estadoFiltro' onchange='this.form.submit()'>
							<option value = "Todos los estados"
							<?php
							
								if ($_SESSION["estadoSeleccion"] == "Todos los estados")
											echo " selected";
							
							?>
							>Todos los estados</option>
							<option value = "programada"
							<?php
							
								if ($_SESSION["estadoSeleccion"] == "programada")
											echo " selected";
							
							?>
							>programada</option>
							<option value = "despachada"
							<?php
							
								if ($_SESSION["estadoSeleccion"] == "despachada")
											echo " selected";
							
							?>							
							>despachada</option>
						</select>
					</div>
					<br>
					<div align="center">
						<input type="submit" name="cerrar" value="Cerrar">
					</div>
					<br>
					<table border="1">
						<tr>
							<th nowrap>Numero</th>
							<th nowrap>Pre-cerrar</th>
							<th nowrap>Demorar</th>
							<th nowrap>Estado</th>
							<th nowrap>Tipo de Orden</th>
							<th nowrap>Sistema Generador</th>
							<th nowrap>Fecha Creacion</th>
							<th nowrap>Fecha Prevista</th>
							<th nowrap>Equipo Asignado</th>
							<th nowrap>Cliente</th>
							<th nowrap>Departamento</th>
							<th nowrap>localidad</th>
						</tr>
						<?php
							for ($i = 0; $i < sizeof($_SESSION["listadoOrdenes"]); $i++){
								echo "<tr>";
								    $fechacreacion = substr($_SESSION["listadoOrdenes"][$i]["fechahoracreacion"], 8, 2) . "/" . substr($_SESSION["listadoOrdenes"][$i]["fechahoracreacion"], 5, 2) . "/" . substr($_SESSION["listadoOrdenes"][$i]["fechahoracreacion"], 0, 4);
									$fechaprevista = substr($_SESSION["listadoOrdenes"][$i]["fechaprevista"], 8, 2) . "/" . substr($_SESSION["listadoOrdenes"][$i]["fechaprevista"], 5, 2) . "/" . substr($_SESSION["listadoOrdenes"][$i]["fechaprevista"], 0, 4);
									// echo "<td>" . $_SESSION["listadoOrdenes"][$i]["numero"] . "</td>";
									echo '<td nowrap><a href="../consultarordenes/controladorDesplegarOrden.php?nroOT=' . $_SESSION["listadoOrdenes"][$i]["numero"] . '&siguientescript="vistaListarOrdenes.php">' . $_SESSION["listadoOrdenes"][$i]["numero"] . '</a></td>';
									
									echo '<td nowrap><a href="controladorAccionOTEquipos.php?ordenElegida=' . $_SESSION["listadoOrdenes"][$i]["numero"] . '&accion=pre-cerrada">Pre-cerrar</a></td>';

									echo '<td align="center" nowrap><a href="controladorAccionOTEquipos.php?ordenElegida=' . $_SESSION["listadoOrdenes"][$i]["numero"] . '&accion=demorada">Demorar</a></td>';

									echo "<td nowrap>" . $_SESSION["listadoOrdenes"][$i]["estado"] . "</td>";
									echo "<td nowrap>" . obtenerDescripcionTipoOrden($_SESSION["listadoOrdenes"][$i]["tipoorden"]) . "</td>";
									echo "<td nowrap>" . obtenerDescripcionSistemaGenerador($_SESSION["listadoOrdenes"][$i]["sistemaemisor"]) . "</td>";
									echo "<td nowrap>" . $fechacreacion . "</td>";
									echo "<td nowrap>" . $fechaprevista . "</td>";
									echo "<td nowrap>" . $_SESSION["listadoOrdenes"][$i]["equipo"] . "</td>";
									echo "<td nowrap>" . $_SESSION["listadoOrdenes"][$i]["nombrecliente"] . " " . $_SESSION["listadoOrdenes"][$i]["apellidocliente"] . "</td>";
									echo "<td nowrap>" .obtenerNombreDepartamento($_SESSION["listadoOrdenes"][$i]["departamento"]) . "</td>";
									echo "<td nowrap>" . obtenerNombreLocalidad($_SESSION["listadoOrdenes"][$i]["localidad"]) . "</td>";
								echo "<tr>";
							}						
						?>
					</table>
					<br>
					<div align="center">
						<input type="submit" name="cerrar" value="Cerrar">
					</div>	
				</form>
			</div>
		</div>
	<body>
</html>	