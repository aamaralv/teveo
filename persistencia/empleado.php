<?php

include_once("conexion.php");



function listar_empleados(&$empleados, &$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM empleado ;";
    $indice = 0;
    $empleados = array();
    
    $result=mysqli_query($con, $select);
    
    if (!$result) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error = true;
    } else {
        while ($row = mysqli_fetch_row($result)) {

            $datos['ci'] = $row[0];
            $datos['identificador'] = $row[1];
            $datos['nombre'] = $row[2];
            $datos['telefono'] = $row[3];
            $datos['identificadorequipo'] = $row[4];
            $datos['rolid'] = $row[5];
            $datos['password'] = $row[6];
            $datos['login'] = $row[7];
            $datos['habilitado'] = $row[8];
            $empleados[$indice] = $datos;
            $indice++;
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}

function obtener_empleado($ci,&$empleado,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM empleado where ci=".$ci;
  
    $result=mysqli_query($con, $select);
    
    if (!$result) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error = true;
    } else {
        while ($row = mysqli_fetch_row($result)) {
            
            $empleado['ci'] = $row[0];
            $empleado['identificador'] = $row[1];
            $empleado['nombre'] = $row[2];
            $empleado['telefono'] = $row[3];
            $empleado['identificadorequipo'] = $row[4];
            $empleado['rolid'] = $row[5];
            $empleado['password'] = $row[6];
            $empleado['login'] = $row[7];
            $empleado['habilitado'] = $row[8];
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}

function login_empleado($login,&$password,&$empleado,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM empleado where login="."'$login' and "."password="."'$password'";
  
    $result=mysqli_query($con, $select);
    
    if (!$result) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error = true;
    } else {
        while ($row = mysqli_fetch_row($result)) {
            
            $empleado['ci'] = $row[0];
            $empleado['identificador'] = $row[1];
            $empleado['nombre'] = $row[2];
            $empleado['telefono'] = $row[3];
            $empleado['identificadorequipo'] = $row[4];
            $empleado['rolid'] = $row[5];
            $empleado['password'] = $row[6];
            $empleado['login'] = $row[7];
            $empleado['habilitado'] = $row[8];
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}

function insertar_empleado($ci,$identificador,$nombre,$telefono,$identificadorequipo,$rolid,$password,$login,$habilitado,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $insert = "INSERT INTO empleado (ci,identificador,nombre,telefono,identificadorequipo,rolid,password,login,habilitado)"
    . " VALUES ("."'$ci',"."'$identificador',"."'$nombre',"."'$telefono',"."'$identificadorequipo',"."$rolid".",'$password',"."'$login',"."$habilitado". ")";

    if (!mysqli_query($con, $insert)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'El empleado fue registrado con exito';
    }
     cerrar_conexion($con);
     
     return $error;
}

function actualizar_empleado($ci,$identificador,$nombre,$telefono,$identificadorequipo,$rolid,$password,$login,$habilitado,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $update = "UPDATE empleado SET nombre="."'$nombre'".",telefono="."'$telefono'".",identificadorequipo="."'$identificadorequipo'".",rolid="."$rolid".
     ",password="."'$password'".",login="."'$login'".",habilitado=".$habilitado." where ci=".$ci." and identificador="."'$identificador'";

    if (!mysqli_query($con, $update)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'El empleado fue actualizado con exito';
    }
     cerrar_conexion($con);
     
     return $error;
}

function borrar_empleado($ci,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $delete = "DELETE FROM empleado where ci=".$ci;

    if (!mysqli_query($con, $delete)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'El empleado fue eliminado con exito';
    }
     cerrar_conexion($con);
     
     return $error;
}

?>