<?php

include_once("conexion.php");

function insertar_equipo_habilidad($habilidadid,$identificadorequipo,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $insert = "INSERT INTO equipohabilidad (habilidadid,identificadorequipo)"
    . " VALUES ("."$habilidadid,"."'$identificadorequipo'". ")";

    if (!mysqli_query($con, $insert)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'El equipo y habilidad fueron registrados con exito';
    }
     cerrar_conexion($con);
     
     return $error;
}

function borrar_equipo_habilidad($habilidadid,$identificadorequipo,&$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $delete = "DELETE FROM equipohabilidad where identificadorequipo="."'$identificadorequipo'". " and habilidadid=".$habilidadid;

    if (!mysqli_query($con, $delete)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'El equipo y habilidad fueron eliminados con exito';
    }
     cerrar_conexion($con);
     
     return $error;
}

?>