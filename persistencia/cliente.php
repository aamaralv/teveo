<?php

include_once("conexion.php");



function listar_clientes(&$clientes, &$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM cliente ;";
    $indice = 0;
    $clientes = array();
    
    $result=mysqli_query($con, $select);
    
    if (!$result) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error = true;
    } else {
        while ($row = mysqli_fetch_row($result)) {

            $datos['id'] = $row[0];
            $datos['nombre'] = $row[1];
            $datos['apellido'] = $row[2];
            $datos['telefono'] = $row[3];
            $datos['direccion'] = $row[4];
            $datos['habilitado'] = $row[5];
            $clientes[$indice] = $datos;
            $indice++;
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}

function obtener_cliente($id,&$cliente,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM cliente where id=".$id;
  
    $result=mysqli_query($con, $select);
    
    if (!$result) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error = true;
    } else {
        while ($row = mysqli_fetch_row($result)) {

            $cliente['id'] = $row[0];
            $cliente['nombre'] = $row[1];
            $cliente['apellido'] = $row[2];
            $cliente['telefono'] = $row[3];
            $cliente['direccion'] = $row[4];
            $cliente['habilitado'] = $row[5];
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}

function insertar_cliente($nombre,$apellido,$telefono,$direccion,$habilitado,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $insert = "INSERT INTO cliente (nombre,apellido,telefono,direccion,habilitado)"
    . " VALUES ("."'$nombre',"."'$apellido',"."'$telefono',"."'$direccion',"."$habilitado". ")";

    if (!mysqli_query($con, $insert)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'El cliente fue registrado con exito';
    }
     cerrar_conexion($con);
     
     return $error;
}

function actualizar_cliente($id,$nombre,$apellido,$telefono,$direccion,$habilitado,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $update = "UPDATE cliente SET nombre="."'$nombre'".",apellido="."'$apellido'".",telefono="."'$telefono'".",direccion="."'$direccion'".
     ",habilitado=".$habilitado." where id=".$id;

    if (!mysqli_query($con, $update)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'El cliente fue actualizado con exito';
    }
     cerrar_conexion($con);
     
     return $error;
}

function borrar_cliente($id,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $delete = "DELETE FROM cliente where id=".$id;

    if (!mysqli_query($con, $delete)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'El cliente fue eliminado con exito';
    }
     cerrar_conexion($con);
     
     return $error;
}

?>