<?php

include_once("conexion.php");
include_once("funcionesDB.php");


function listar_ordenes_de_trabajo($campos,$criterios,&$resultados, &$mensaje) {
    $conexion = abrir_conexion();

    $error=select($conexion,TABLA_ORDEN_DE_TRABAJO,$campos,$criterios,$resultados,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function obtener_orden_de_trabajo($campos,$criterios,&$resultado, &$mensaje) {
    $conexion = abrir_conexion();
	
    $error=select($conexion,TABLA_ORDEN_DE_TRABAJO,$campos,$criterios,$resultado,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function insertar_orden_de_trabajo($campos,$valores,&$mensaje, &$ordengenerada) {
    $conexion = abrir_conexion();

    $error=insert($conexion,TABLA_ORDEN_DE_TRABAJO,$campos, $valores,$mensaje,$ordengenerada);
  	
    cerrar_conexion($conexion);
    
    return $error;
}

function actualizar_orden_de_trabajo($valores,$criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=update($conexion,TABLA_ORDEN_DE_TRABAJO,$valores,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function borrar_orden_de_trabajo($criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=delete($conexion,TABLA_ORDEN_DE_TRABAJO,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}


// funciones auxiliares para trabajar con ordenes de trabajo Generacion/Programacion/visualizacion

function obtenerDescripcionTipoOrden($codigo){ // usada en GenerarOrdenDeTrabajoComercial.php
// recibe un codigo de tipo de orden en formato string(1)
// devuelve la descripcion del tipo de orden en formato string
	$conexion = abrir_conexion();
	$tabla = "tipo_de_ordenes";
	$campos = "descripcion";
	$criterios = "codigo = '". $codigo ."'";
	$resultado = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);
	if (isset($resultado[0][0]))
		return $resultado[0]["descripcion"];
	else
		return $codigo . "-No especificado";
}
 
function obtenerDescripcionTipoTarea($codigo){ // usada en GenerarOrdenDeTrabajoComercial.php
// recibe un codigo de tipo de tarea en formato string(1)
// devuelve un string con la descripcion de la tarea
	$conexion = abrir_conexion();
	$tabla = "tipos_de_tarea";
	$campo = "descripcion";
	$criterios = "codigo = '". $codigo ."'";
	$resultado = consultarEnBD($conexion, $tabla, $campo, $criterios);
	cerrar_conexion($conexion);
	if (isset($resultado[0][0]))
		return $resultado[0][$campo];
	else
		return $codigo . "-No especificado";
}
 
function obtenerAplicaHabilidadesDelProducto($codigo){
// recibe un codigo de tipo tarea en formato string(1)
// devuelve un codigo numerico 0 o 1
	$tabla = "tipos_de_tarea";
	$campo = "aplica_habilidades_del_producto";
	$criterios = "codigo = '". $codigo ."'";
	$conexion = abrir_conexion();
	$resultado = consultarEnBD($conexion, $tabla, $campo, $criterios);
	cerrar_conexion($conexion);
																									$salida = 'obtenerAplicaHabilidadesDelProducto0.txt';
																									file_put_contents($salida,"Codigo " . $codigo . "Resultado " . $resultado[0][$campo]);
	return $resultado[0][$campo];
}

function obtenerListaTareas(){
// no recibe parametros
// devuelve una matriz con cada fila conteniendo una codigo de tarea string(1) y la descripcion de la tarea string(100)
	$tabla = "tipos_de_tarea";
	$campos = "codigo, descripcion";
	$criterios = "1";
	//Ejecuto la sentencia
	$conexion = abrir_conexion();
	$tabla = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);
	return $tabla;	
}
 
function obtenerDescripcionSistemaGenerador($codigo){ // usada en GenerarOrdenDeTrabajoComercial.php
// recibe un codigo de sistema generador en formato string(1)
// devuelve la descripcion del sistema generadore en formato string
	$tabla = "sistema_emisor";
	$campo = "descripcion";
	$criterios = "codigo = '". $codigo ."'";
	$conexion = abrir_conexion();
	$resultado = consultarEnBD($conexion, $tabla, $campo, $criterios);
	cerrar_conexion($conexion);
	if (isset($resultado[0][0]))
		return $resultado[0][$campo];
	else
		return $codigo . "-No especificado";
}
 
function obtenerListaProductosXAccion($accion){
// recibe como parametro un codigo de acción en formato string(3)
// devuelve una matriz con cada fila conteniendo una codigo de localidad string(6) y el nombre del departamento string
	$tabla = "tipos_de_producto";
	$campos = "codigo, descripcion, habilidad";
	$criterios = "accion = '" . $accion . "'";
	//Ejecuto la sentencia
	$conexion = abrir_conexion();
	$tabla = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);
	return $tabla;
}

function obtenerDescripcionTipoProducto($codigo){
// recibe un codigo de producto en formato string(3)
// devuelve la descripcion del producto en formato string
	$tabla = "tipos_de_producto";
	$campo = "descripcion";
	$criterios = "codigo = '". $codigo ."'";
	$conexion = abrir_conexion();
	$resultado = consultarEnBD($conexion, $tabla, $campo, $criterios);
	cerrar_conexion($conexion);
	if (isset($resultado[0][0]))
		return $resultado[0][$campo];
	else
		return $codigo . "-No especificado";
}
 
function obtenerListadoHabilidadesDescripcionPeso(){ // usada en GenerarOrdenDeTrabajoComercial.php
// no recibe parametros
// devuelve una matriz con cada fila conteniendo una descripción y codigo de habilidad
	$tabla = "habilidad";
	$campos = "descripcion, peso";
	$criterios = "1";
	//Ejecuto la sentencia
	$conexion = abrir_conexion();
	$tablaHabilidades = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);
	return $tablaHabilidades;
}

function obtenerPesoDeHabilidad($codigo){
// recibe un codigo de habiidad y busca en la bd el peso de la habilidad
// devuelve un entero
	$tabla = "habilidad";
	$campo = "peso";
	$criterios = "codigo = '". $codigo . "'";
	$conexion = abrir_conexion();
	$resultado = consultarEnBD($conexion, $tabla, $campo, $criterios);
	cerrar_conexion($conexion);
	if (sizeof($resultado) > 0)
		return $resultado[0]["peso"];
	else
		return "1";
}

function tareaConHabilidadIndependienteDeProducto($tarea){
// recibe un codigo de tarea y busca en la bd si la tarea aplica habilidades del producto
// si no aplica habilidades del producto devuelve la habilidad requerida por la tarea
	$tabla = " tipos_de_tarea";
	$campo = "	aplica_habilidades_del_producto, habilidadrequerida";
	$criterios = "descripcion = '". $tarea . "'";
	$conexion = abrir_conexion();
	$resultado = consultarEnBD($conexion, $tabla, $campo, $criterios);
	cerrar_conexion($conexion);

	if (sizeof($resultado) > 0)
		if($resultado[0]["aplica_habilidades_del_producto"])
			return "0";
		else
			return $resultado[0]["habilidadrequerida"];
	else
		return "0";
	
}


function obtenerHabilidadesTipoProducto($codigo, $accion){
// recibe un codigo de producto en formato string(3) y un codigo de accion en formato string
// si existe combinacion en la bd para la tupla codigo accion devuelve el valor obtenido,
// de lo contrario devuelve "1"
																									$salida = 'ordentrabajo-obtenerHabilidadesTipoProducto0.txt';
																									file_put_contents($salida, "accion " . $accion . " codigo " . $codigo);
																									
																									
																									
if (obtenerAplicaHabilidadesDelProducto($accion))
{
	$tabla = "tipos_de_producto";
	$campo = "habilidad";
	$criterios = "codigo = '". $codigo ."' AND accion = '" . $accion . "'";
	$conexion = abrir_conexion();
	$resultado = consultarEnBD($conexion, $tabla, $campo, $criterios);
	cerrar_conexion($conexion);
																									$salida = 'ordentrabajo-obtenerHabilidadesTipoProducto1.txt';
																									file_put_contents($salida, "Dentro del IF resultado" . $resultado[0][$campo]);
	if (isset($resultado[0][0]))
		return $resultado[0][$campo];
	else
		return $codigo . "1";
}	
else
{
																									$salida = 'ordentrabajoobtenerHabilidadesTipoProducto2.txt';
																									file_put_contents($salida, "Dentro del ELSE ");
	return obtenerPesoDeHabilidad(tareaConHabilidadIndependienteDeProducto($accion));

}
}

function obtenerListaDepartamentos(){
// no recibe parametros
// devuelve una matriz con cada fila conteniendo una codigo de departamento string(3) y el nombre del departamento string
	$tabla = "departamento";
	$campos = "id, nombre_depto";
	$criterios = "1";
	//Ejecuto la sentencia
	$conexion = abrir_conexion();
	$tabla = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);
	return $tabla;
}

function obtenerNombreDepartamento($codigo){
// recibe un codigo de departamento en formato string(3)
// devuelve un string
	$tabla = "departamento";
	$campo = "nombre_depto";
	$criterios = "id = '". $codigo ."'";
	$conexion = abrir_conexion();
	$resultado = consultarEnBD($conexion, $tabla, $campo, $criterios);
	cerrar_conexion($conexion);
	if (isset($resultado[0][0]))
		return $resultado[0][$campo];
	else
		return $codigo . "-Codigo Erroneo";
}
 
function obtenerListaLocalidades($codigoDepto){
// recibe como parametro un codigo de departamento en formato string(3)
// devuelve una matriz con cada fila conteniendo una codigo de localidad string(6) y el nombre del departamento string
	$tabla = "localidad";
	$campos = "id, id_depart, nombre";
	$criterios = "id_depart = '" . $codigoDepto . "'";
	//Ejecuto la sentencia
	$conexion = abrir_conexion();
	$tabla = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);
	return $tabla;
}
 
function obtenerNombreLocalidad($codigo){
// recibe un codigo de localidad en formato string(6)
// devuelve un string
	$tabla = "localidad";
	$campo = "nombre";
	$criterios = "id = '". $codigo ."'";
	$conexion = abrir_conexion();
	$resultado = consultarEnBD($conexion, $tabla, $campo, $criterios);
	cerrar_conexion($conexion);
	if (isset($resultado[0][0]))
		return $resultado[0][$campo];
	else
		return $codigo . "-Codigo Erroneo";
}
 
function obtenerNombreUsuario($usuario){
// recibe string con el nikname del usuario
// devuelve un string con el nombre y apellido del usuario concatenados y separados por un espacio
	$tabla = "empleado";
	$campo = "nombre, apellido";
	$criterios = "login = '". $usuario ."'";
	$conexion = abrir_conexion();
	$resultado = consultarEnBD($conexion, $tabla, $campo, $criterios);
	cerrar_conexion($conexion);
	if (isset($resultado[0][0]))
		return $resultado[0]["nombre"] . " " . $resultado[0]["apellido"];
	else
		return $usuario . "-sin nombre";
}

function obtenerEquiposZonaOrden($localidad){
	$tabla = "equipo";
	$campos = "identificador, habilidades";
	$criterios = "codigozona = '" . $localidad .  "'";
	$conexion = abrir_conexion();
	$tablaEquipos = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);
	return $tablaEquipos;
}

function esFeriado($dia){
	// se convierte la fecha recibida a string
	$diastr = "'" . date("Y", $dia) . "-" . date("m", $dia) . "-" . date("d", $dia) . "'";
	$tabla = "feriados";
	$campos = "descripcion";
	$criterios = "(fecha = " . $diastr . ")"; 
	$conexion = abrir_conexion();
	$feriado = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);
	return sizeof($feriado);
}

function esDiaDeCuotaExcepcionalParaEquipo($dia, $equipo){
	// se convierte la fecha recibida a string
	$diastr = "'" . date("Y", $dia) . "-" . date("m", $dia) . "-" . date("d", $dia) ."'";
	$tabla = "cuota_excepcional";
	$campos = "cuota";
	$criterios = "(fecha_aplicacion = " . $diastr . " AND identificadorequipo = '" . $equipo . "')"; 
	$conexion = abrir_conexion();
	$cuota = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);
	return sizeof($cuota);	
}

function cuotaExcepcionalParaEquipoEnDia($equipo, $dia){
	// se convierte la fecha recibida a string
	$diastr = "'" . date("Y", $dia) . "-" . date("m", $dia) . "-" . date("d", $dia) ."'";
	$tabla = "cuota_excepcional";
	$campos = "cuota";
	$criterios = "(fecha_aplicacion = " . $diastr . " AND identificadorequipo = '" . $equipo . "')"; 
	$conexion = abrir_conexion();
	$cuota = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);
	return $feriado[0]["cuota"];	
}

function cotasDelEquipo($equipo){
	$tabla = "equipo";
	$campos = "cuotadiaslaborales, cuotasabado, cuotadomingo, cuotaferiado";
	$criterios = "(identificador = '" . $equipo . "')"; 
	$conexion = abrir_conexion();
	$cuotas = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);
	$cuotas = $cuotas[0];
	return $cuotas;	
	
}

function cuotaDelEquipoParaElDia($equipo, $diaelegido){
	if(esDiaDeCuotaExcepcionalParaEquipo($diaelegido, $equipo))
		return cuotaExcepcionalParaEquipoEnDia($equipo, $diaelegido);
	else{
		$cuotas = cotasDelEquipo($equipo);
		if (esFeriado($diaelegido))
			return $cuotas["cuotaferiado"];
		else
			if (date('N', $diaelegido) == 7)
				return $cuotas["cuotadomingo"];
			else
				if(date('N', $diaelegido) == 6)
					return $cuotas["cuotasabado"];
				else 
					return $cuotas["cuotadiaslaborales"];
	}
} 

function cantidadOTdelEquipoParaElDia($equipo, $diaelegido){
	$diastr = "'" . date("Y", $diaelegido) . "-" . date("m", $diaelegido) . "-" . date("d", $diaelegido) ."'";
	$tabla = "orden_de_trabajo";
	$campos = " * ";
	$criterios = "(equipo = '" . $equipo . "' AND fechaprevista = " . $diastr . " )"; 
	$conexion = abrir_conexion();
	$ordenes = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);
	return sizeof($ordenes);
}

function bloquearEquipo($equipo, $usuario){
//																														$salida = 'salidaBloquearEquipo.txt';
//																														file_put_contents($salida, "Equipo a bloquear " . $equipo . " por usuario " . $usuario);	
	return "si";
}

function desbloquearEquipo($equipo, $usuario){
//																														$salida = 'salidaDesbloquearEquipo.txt';
//																														file_put_contents($salida, "Equipo a desbloquear " . $equipo . " de usuario " . $usuario);	
}

function listaEquiposDelSupervisor($supervisor){
	// se recibe un codigo de supervisor
	// se devuelve una tabla con la lista de equipos que gestiona el supervisor y sus habilidades.
	$tabla = "equipo";
	$campos = "identificador, habilidades";
	$criterios = "(identificadorsupervisor = '" . $supervisor . "')"; 
	$conexion = abrir_conexion();
	$lista = consultarEnBD($conexion, $tabla, $campos, $criterios);
	cerrar_conexion($conexion);

	return $lista;
}

?>