<?php

include_once("conexion.php");
include_once("funcionesDB.php");


function listar_tipos_de_tarea($campos,$criterios,&$roles, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_TIPOS_DE_TAREA,$campos,$criterios,$roles,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function obtener_tipo_de_tarea($campos,$criterios,&$resultado, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_TIPOS_DE_TAREA,$campos,$criterios,$resultado,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function insertar_tipo_de_tarea($campos,$valores,&$mensaje) {
    $conexion = abrir_conexion();
    
    $error=insert($conexion,TABLA_TIPOS_DE_TAREA,$campos, $valores,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function actualizar_tipo_de_tarea($valores,$criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=update($conexion,TABLA_TIPOS_DE_TAREA,$valores,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function borrar_tipo_de_tarea($criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=delete($conexion,TABLA_TIPOS_DE_TAREA,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}



?>