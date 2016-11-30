<?php

include_once("../../persistencia/equipo.php");



function obtener_equipos(&$equipos, &$mensaje) {

    $campos = array("codigodeequipo",
        "supervisor",
        "cuotadiaslaborales",
        "cuotasabado",
        "cuotadomingo",
        "cuotaferiado",
        "habilidades",
        "codigozona");
    $criterios = array();
    $error=listar_equipos($campos, $criterios, $equipos, $mensaje);
    return $error; 
}


function borrar_equipo_logica($codigodequipo, &$mensaje) {
    $criterios = array("codigodeequipo='".$codigodequipo."'");
    $error=borrar_equipo($criterios, $mensaje);
    return $error; 
}


if (isset($_POST['Modificar_Equipo'])) {
    
    $codigodequipo=$_POST["codigoequipo"];
    $supervisor=$_POST["supervisor"];
    $cuotadiaslaborales=$_POST["cuotadiaslaborales"];
    $cuotasabado=$_POST["cuotasabado"];
    $cuotadomingo=$_POST["cuotadomingo"];
    $cuotaferiado=$_POST["cuotaferiado"];
    $habilidades=$_POST["habilidades"];
    $codigozona=$_POST["codigozona"];
    
    $mensaje = "";

    $valores=array(
     "supervisor='".$supervisor."'",
     "cuotadiaslaborales=".$cuotadiaslaborales,
     "cuotasabado=".$cuotasabado,
     "cuotadomingo=".$cuotadomingo,
     "cuotaferiado=".$cuotaferiado,
     "habilidades=".$habilidades,
     "codigozona='".$codigozona."'");	
    $criterios=array("codigodeequipo='".$codigodequipo."'");

    
    
    $error=actualizar_equipo($valores,$criterios,$mensaje);
    if($error){
        echo$mensaje,"<br>";
        die;
    }
   
    header("Location: ../../presentacion/equipo/listarEquipos.php");
}elseif (isset($_POST['Crear_Equipo'])) {
    
    $codigodequipo=$_POST["codigoequipo"];
    $supervisor=$_POST["supervisor"];
    $cuotadiaslaborales=$_POST["cuotadiaslaborales"];
    $cuotasabado=$_POST["cuotasabado"];
    $cuotadomingo=$_POST["cuotadomingo"];
    $cuotaferiado=$_POST["cuotaferiado"];
    $habilidades=$_POST["habilidades"];
    $codigozona=$_POST["codigozona"];
    
    $mensaje = "";

  
     $campos=array("codigodeequipo",
     "supervisor",
     "cuotadiaslaborales",
     "cuotasabado",
     "cuotadomingo",
     "cuotaferiado",
     "habilidades",
     "codigozona"); 
   
   
    $valores=array("'$codigodequipo'",
     "'$supervisor'",
     $cuotadiaslaborales,
     $cuotasabado,
     $cuotadomingo,
     $cuotaferiado,
     $habilidades,
     "'$codigozona'");	
    

   
    
    $error= insertar_equipo($campos,$valores,$mensaje);
    if($error){
        echo$mensaje,"<br>";
        die;
    }
   
    header("Location: ../../presentacion/equipo/listarEquipos.php");
    
    
}


?>	
