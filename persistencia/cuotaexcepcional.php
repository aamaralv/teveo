<?php

include_once("conexion.php");
include_once("funcionesDB.php");


function listar_cuotas_excepcionales($campos,$criterios,&$roles, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_CUOTA_EXCEPCIONAL,$campos,$criterios,$roles,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function obtener_cuota_excepcional($campos,$criterios,&$resultado, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_CUOTA_EXCEPCIONAL,$campos,$criterios,$resultado,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function insertar_cuota_excepcional($campos,$valores,&$mensaje) {
    $conexion = abrir_conexion();
    
    $error=insert($conexion,TABLA_CUOTA_EXCEPCIONAL,$campos, $valores,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function actualizar_cuota_excepcional($valores,$criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=update($conexion,TABLA_CUOTA_EXCEPCIONAL,$valores,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function borrar_cuota_excepcional($criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=delete($conexion,TABLA_CUOTA_EXCEPCIONAL,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}



?>