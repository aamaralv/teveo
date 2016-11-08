<?php

include_once("conexion.php");



function listar_productos(&$productos, &$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM tipoproducto;";
    $indice = 0;
    $productos = array();
    
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
            $productos[$indice] = $datos;
            $indice++;
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}

function obtener_producto($id,&$producto,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM tipoproducto where id=".$id;
  
    $result=mysqli_query($con, $select);
    
    if (!$result) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error = true;
    } else {
        while ($row = mysqli_fetch_row($result)) {

            $producto['id'] = $row[0];
            $producto['nombre'] = $row[1];
            $producto['habilitado'] = $row[2];
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}



?>