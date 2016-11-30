<?php

include_once("../../persistencia/cuotaexcepcional.php");

function obtener_cuotas(&$cuotas, &$mensaje) {

    $campos = array(
        "id",
        "equipo",
        "fecha_cambio",
        "usuario_cambio",
        "fecha_aplicacion",
        "cuota",
        );
    $criterios = array();
    $error=listar_cuotas_excepcionales($campos, $criterios, $cuotas, $mensaje);
    return $error; 
}


function borrar_cuota_logica($id, &$mensaje) {
    $criterios = array("id='".$id."'");
    $error=borrar_cuota_excepcional($criterios, $mensaje);
    return $error; 
}


if (isset($_POST['Modificar_Cuota'])) {
    
    $fecha=$_POST["fecha"];
    $descripcion=$_POST["descripcion"];
    $id=$_POST["id"];
  
    $mensaje = "";

    $valores=array(
     "descripcion='".$descripcion."'",
     "fecha='".$fecha."'",);	
    $criterios=array("id='".$id."'");

    
    
    $error=actualizar_cuota_excepcional($valores,$criterios,$mensaje);
    if($error){
        echo $mensaje,"<br>";
        die;
    }
   
    header("Location: ../../presentacion/cuota/listarCuotas.php");
}elseif (isset($_POST['Crear_Cuota'])) {
    

    $fecha= date('Y-m-d',strtotime($_POST["fecha"]));
    $equipo=$_POST["equipo"];
    $cuota=$_POST["cuota"];
    $mensaje = "";
 
     $campos=array("fecha_aplicacion","equipo","cuota"); 
   


    $valores=array("'". $fecha ."'","'$equipo'",$cuota);	


    $error= insertar_cuota_excepcional($campos,$valores,$mensaje);
    if($error){
        echo $mensaje,"<br>";
        die;
    }
    header("Location: ../../presentacion/cuota/listarCuotas.php");   
}
?>	
