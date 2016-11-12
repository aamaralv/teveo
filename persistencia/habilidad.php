<?php

include_once("conexion.php");
include_once("funcionesDB.php");


function listar_habilidades($campos,$criterios,&$resultados, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_HABILIDAD,$campos,$criterios,$$resultados,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function obtener_habilidad($campos,$criterios,&$resultado, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_HABILIDAD,$campos,$criterios,$resultado,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function insertar_habilidad($campos,$valores,&$mensaje) {
    $conexion = abrir_conexion();
    
    $error=insert($conexion,TABLA_HABILIDAD,$campos, $valores,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function actualizar_habilidad($valores,$criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=update($conexion,TABLA_HABILIDAD,$valores,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function borrar_habilidad($criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=delete($conexion,TABLA_HABILIDAD,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

?>