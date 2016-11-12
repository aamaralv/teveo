<?php

include_once("conexion.php");
include_once("funcionesDB.php");


function listar_auditorias_cuotas($campos,$criterios,&$roles, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_AUDITORIA_CUOTA,$campos,$criterios,$roles,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function obtener_auditoria_cuota($campos,$criterios,&$resultado, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_AUDITORIA_CUOTA,$campos,$criterios,$resultado,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function insertar_auditoria_cuota($campos,$valores,&$mensaje) {
    $conexion = abrir_conexion();
    
    $error=insert($conexion,TABLA_AUDITORIA_CUOTA,$campos, $valores,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function actualizar_auditoria_cuota($valores,$criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=update($conexion,TABLA_AUDITORIA_CUOTA,$valores,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function borrar_auditoria_cuota($criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=delete($conexion,TABLA_AUDITORIA_CUOTA,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}



?>