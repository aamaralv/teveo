<?php

include_once("conexion.php");
include_once("funcionesDB.php");


function listar_equipos($campos,$criterios,&$resultados, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_EQUIPO,$campos,$criterios,$resultados,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function obtener_equipo($campos,$criterios,&$resultado, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_EQUIPO,$campos,$criterios,$resultado,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function insertar_equipo($campos,$valores,&$mensaje) {
    $conexion = abrir_conexion();
    
    $error=insert($conexion,TABLA_EQUIPO,$campos, $valores,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function actualizar_equipo($valores,$criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=update($conexion,TABLA_EQUIPO,$valores,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function borrar_equipo($criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=delete($conexion,TABLA_EQUIPO,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

?>