<?php

include_once("conexion.php");
include_once("funcionesDB.php");


function listar_tipos_de_productos($campos,$criterios,&$resultados, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_TIPOS_DE_PRODUCTO,$campos,$criterios,$$resultados,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function obtener_tipo_de_producto($campos,$criterios,&$resultado, &$mensaje) {
    $conexion = abrir_conexion();
    
    $error=select($conexion,TABLA_TIPOS_DE_PRODUCTO,$campos,$criterios,$resultado,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function insertar_tipo_de_producto($campos,$valores,&$mensaje) {
    $conexion = abrir_conexion();
    
    $error=insert($conexion,TABLA_TIPOS_DE_PRODUCTO,$campos, $valores,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function actualizar_tipo_de_producto($valores,$criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=update($conexion,TABLA_TIPOS_DE_PRODUCTO,$valores,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

function borrar_tipo_de_producto($criterios,&$mensaje) {
    $conexion = abrir_conexion();

    $error=delete($conexion,TABLA_TIPOS_DE_PRODUCTO,$criterios,$mensaje);
	
    cerrar_conexion($conexion);
    
    return $error;
}

?>