<?php

include_once("conexion.php");



function listar_habilidades(&$habilidades, &$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM habilidad;";
    $indice = 0;
    $habilidades = array();
    
    $result=mysqli_query($con, $select);
    
    if (!$result) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error = true;
    } else {
        while ($row = mysqli_fetch_row($result)) {

            $datos['id'] = $row[0];
            $datos['nombre'] = $row[1];
            $datos['habilitado'] = $row[2];
            $habilidades[$indice] = $datos;
            $indice++;
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}

function obtener_habilidad($id,&$habilidad,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM habilidad where id=".$id;
  
    $result=mysqli_query($con, $select);
    
    if (!$result) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error = true;
    } else {
        while ($row = mysqli_fetch_row($result)) {

            $habilidad['id'] = $row[0];
            $habilidad['nombre'] = $row[1];
            $habilidad['habilitado'] = $row[2];
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}

function modificar_habilidad($id,$codigo,$descripcion,$peso)
{
    $error=false;
    $con = abrir_conexion();
    $updateSQL = "UPDATE habilidad SET codigo=".$codigo. ",descripcion=".$descripcion.",peso=".$peso;
  
    $result=mysqli_query($con, $updateSQL);
    
      if (!mysqli_query($con, $updateSQL)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'La habilidad fue actualizada correctamente.';
    }
      
    cerrar_conexion($con);
    
    return $error;
}

function insertar_habilidad($id,$nombre)
{
    # code...
}


?>