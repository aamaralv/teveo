<?php

include_once("conexion.php");



function listar_tareas(&$tareas, &$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM tipotarea ;";
    $indice = 0;
    $tareas = array();
    
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
            $tareas[$indice] = $datos;
            $indice++;
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}

function obtener_tarea($id,&$tarea,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM tipotarea where id=".$id;
  
    $result=mysqli_query($con, $select);
    
    if (!$result) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error = true;
    } else {
        while ($row = mysqli_fetch_row($result)) {

            $tarea['id'] = $row[0];
            $tarea['nombre'] = $row[1];
            $tarea['habilitado'] = $row[2];
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}



?>