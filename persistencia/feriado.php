<?php

include_once("conexion.php");
include_once("funcionesDB.php");


function listar_feriados($campos,$criterios,&$roles, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_FERIADO,$campos,$criterios,$roles,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function obtener_feriado($campos,$criterios,&$resultado, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_FERIADO,$campos,$criterios,$resultado,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function insertar_feriado($campos,$valores,&$mensaje) {
    $conexion = abrir_conexion();
    
    $error=insert($conexion,TABLA_FERIADO,$campos, $valores,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function actualizar_feriado($valores,$criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=update($conexion,TABLA_FERIADO,$valores,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function borrar_feriado($criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=delete($conexion,TABLA_FERIADO,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}



?>