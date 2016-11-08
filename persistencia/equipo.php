<?php

include_once("conexion.php");



function listar_equipos(&$equipos, &$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM equipo ;";
    $indice = 0;
    $equipos = array();
    
    $result=mysqli_query($con, $select);
    
    if (!$result) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error = true;
    } else {
        while ($row = mysqli_fetch_row($result)) {

            $equipo['identificador'] = $row[0];
            $equipo['supervisorid'] = $row[1];
            $equipo['cuotadiaslaborales'] = $row[2];
            $equipo['cuotasabado'] = $row[3];
            $equipo['cuotadomingo'] = $row[4];
            $equipo['cuotaferiado'] = $row[5];
            $equipos[$indice] = $equipo;
            $indice++;
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}

function obtener_equipo($identificador,&$equipo,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $select = "SELECT * FROM equipo where identificador="."'$identificador'";
  
    $result=mysqli_query($con, $select);
    
    if (!$result) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error = true;
    } else {
        while ($row = mysqli_fetch_row($result)) {
            
            $equipo['identificador'] = $row[0];
            $equipo['supervisorid'] = $row[1];
            $equipo['cuotadiaslaborales'] = $row[2];
            $equipo['cuotasabado'] = $row[3];
            $equipo['cuotadomingo'] = $row[4];
            $equipo['cuotaferiado'] = $row[5];
          
        }

        mysqli_free_result($result);
    }
    cerrar_conexion($con);
    
    return $error;
}

function insertar_equipo($identificador,$supervisorid,$cuotadiaslaborales,$cuotasabado,$cuotadomingo,$cuotaferiado,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $insert = "INSERT INTO equipo (identificador,supervisorid,cuotadiaslaborales,cuotasabado,cuotadomingo,cuotaferiado)"
    . " VALUES ("."'$identificador',"."'$supervisorid',"."'$cuotadiaslaborales',"."'$cuotasabado',"."'$cuotadomingo',"."$cuotaferiado". ")";

    if (!mysqli_query($con, $insert)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'El equipo fue registrado con exito';
    }
     cerrar_conexion($con);
     
     return $error;
}

function actualizar_equipo($identificador,$supervisorid,$cuotadiaslaborales,$cuotasabado,$cuotadomingo,$cuotaferiado,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $update = "UPDATE equipo SET supervisorid="."'$supervisorid'".",cuotadiaslaborales="."'$cuotadiaslaborales'".",cuotasabado="."'$cuotasabado'".",cuotadomingo="."$cuotadomingo".
     ",cuotaferiado="."'$cuotaferiado'"." where identificador="."'$identificador'";

    if (!mysqli_query($con, $update)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'El equipo fue actualizado con exito';
    }
     cerrar_conexion($con);
     
     return $error;
}

function borrar_equipo($identificador,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $delete = "DELETE FROM equipo where identificador="."'$identificador'";

    if (!mysqli_query($con, $delete)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'El equipo fue eliminado con exito';
    }
     cerrar_conexion($con);
     
     return $error;
}

?>