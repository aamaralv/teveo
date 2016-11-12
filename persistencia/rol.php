<?php

include_once("conexion.php");
include_once("funcionesDB.php");


function listar_roles($campos,$criterios,&$roles, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_TIPO_DE_ROL,$campos,$criterios,$roles,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function obtener_rol($campos,$criterios,&$resultado, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_TIPO_DE_ROL,$campos,$criterios,$resultado,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function insertar_rol($campos,$valores,&$mensaje) {
    $conexion = abrir_conexion();
    
    $error=insert($conexion,TABLA_TIPO_DE_ROL,$campos, $valores,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function actualizar_rol($valores,$criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=update($conexion,TABLA_TIPO_DE_ROL,$valores,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function borrar_rol($criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=delete($conexion,TABLA_TIPO_DE_ROL,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}



?>