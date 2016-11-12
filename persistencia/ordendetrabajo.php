<?php

include_once("conexion.php");
include_once("funcionesDB.php");


function listar_ordenes_de_trabajo($campos,$criterios,&$resultados, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_ORDEN_DE_TRABAJO,$campos,$criterios,$$resultados,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function obtener_orden_de_trabajo($campos,$criterios,&$resultado, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_ORDEN_DE_TRABAJO,$campos,$criterios,$resultado,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function insertar_orden_de_trabajo($campos,$valores,&$mensaje) {
    $conexion = abrir_conexion();
    
    $error=insert($conexion,TABLA_ORDEN_DE_TRABAJO,$campos, $valores,$mensaje);
	
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

?>