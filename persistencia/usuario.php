<?php

include_once("conexion.php");
include_once("funcionesDB.php");


function listar_usuarios($campos,$criterios,&$usuarios, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_USUARIO,$campos,$criterios,$usuarios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function obtener_usuario($campos,$criterios,&$usuario, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_USUARIO,$campos,$criterios,$usuario,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}


function login_usuario($campos,$criterios,&$usuario, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_USUARIO,$campos,$criterios,$usuario,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function insertar_usuario($campos,$valores,&$mensaje) {
    $conexion = abrir_conexion();
    
    $error=insert($conexion,TABLA_USUARIO,$campos, $valores,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function actualizar_usuario($valores,$criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=update($conexion,TABLA_USUARIO,$valores,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function borrar_usuario($criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=delete($conexion,TABLA_USUARIO,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

?>