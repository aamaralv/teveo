<?php

include_once("conexion.php");



function listar_roles(&$roles, &$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM rol;";
    $indice = 0;
    $roles = array();
    
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
            $roles[$indice] = $datos;
            $indice++;
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}

function obtener_rol($id,&$rol,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM rol where id=".$id;
  
    $result=mysqli_query($con, $select);
    
    if (!$result) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error = true;
    } else {
        while ($row = mysqli_fetch_row($result)) {

            $rol['id'] = $row[0];
            $rol['nombre'] = $row[1];
            $rol['habilitado'] = $row[2];
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}



?>