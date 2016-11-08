<?php

include_once("conexion.php");



function listar_ordenes_de_trabajo(&$ordenes, &$mensaje) {
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

function obtener_orden_de_trabajo($identificador,&$orden,&$mensaje) {
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

function insertar_orden_de_trabajo(
    $tipoorden,$tipotareaid,$fecha,$prioridad,$sistemaomisor,$tipoproductoid,
    $fechacreacion,$identificadorempleado,$fechadistribucion,$fechaprevista,$identificadorequipo,$fechacancelacion,
    $clienteid,$fechadespacho,$comentariosupervisor,$equipodespacho,$fechacierre,$cometariocierre,
    &$mensaje) {
    $error=false;
    $con = abrir_conexion();
    $insert = "INSERT INTO ordendetrabajo (".
     "tipoorden,".
     "tipotareaid,".
     "fecha,".
     "prioridad,".
     "sistemaomisor,".
     "tipoproductoid,".
     "fechacreacion,".
     "identificadorempleado,".
     "fechadistribucion,".
     "fechaprevista,".
     "identificadorequipo,".
     "fechacancelacion,".
     "clienteid,".
     "fechadespacho,".
     "comentariosupervisor,".
     "equipodespacho,".
     "fechacierre,".
     "cometariocierre)".
     " VALUES (".
     "'$tipoorden',".
     "'$tipotareaid',".
     "'$fecha',".
     "'$prioridad',".
     "'$sistemaomisor',".
     "'$tipoproductoid',".
     "'$fechacreacion',".
     "'$identificadorempleado',".
     "'$fechadistribucion',".
     "'$fechaprevista',".
     "'$identificadorequipo',".
     "'$fechacancelacion',".
     "'$clienteid',".
     "'$fechadespacho',".
     "'$comentariosupervisor',".
     "'$equipodespacho',".
     "'$fechacierre',".
     "'$cometariocierre'". ")";

    if (!mysqli_query($con, $insert)) {
        $mensaje=mysqli_error($con);
        $mensaje = 'Mensaje de error: ['.$mensaje.']';
        $error=true;
    }else{
        $mensaje = 'La orden de trabajo fue registrada con exito';
    }
     cerrar_conexion($con);
     
     return $error;
}

function actualizar_orden_de_trabajo($identificador,$supervisorid,$cuotadiaslaborales,$cuotasabado,$cuotadomingo,$cuotaferiado,&$mensaje) {
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

?>