<?php

include_once("../../persistencia/feriado.php");

function obtener_feriados(&$feriados, &$mensaje) {

    $campos = array(
        "id",
        "fecha",
        "descripcion"
        );
    $criterios = array();
    $error=listar_feriados($campos, $criterios, $feriados, $mensaje);
    return $error; 
}


function borrar_feriado_logica($id, &$mensaje) {
    $criterios = array("id='".$id."'");
    $error=borrar_feriado($criterios, $mensaje);
    return $error; 
}


if (isset($_POST['Modificar_Feriado'])) {
    
    $fecha=$_POST["fecha"];
    $descripcion=$_POST["descripcion"];
    $id=$_POST["id"];
  
    $mensaje = "";

    $valores=array(
     "descripcion='".$descripcion."'",
     "fecha='".$fecha."'",);	
    $criterios=array("id='".$id."'");

    
    
    $error=actualizar_feriado($valores,$criterios,$mensaje);
    if($error){
        echo $mensaje,"<br>";
        die;
    }
   
    header("Location: ../../presentacion/feriado/listarFeriados.php");
}elseif (isset($_POST['Crear_Feriado'])) {
    

    $fecha= date('Y-m-d',strtotime($_POST["fecha"]));
    $descripcion=$_POST["descripcion"];
    $mensaje = "";
 
     $campos=array("fecha","descripcion"); 
   


    $valores=array("'". $fecha ."'","'$descripcion'");	


    $error= insertar_feriado($campos,$valores,$mensaje);
    if($error){
        echo $mensaje,"<br>";
        die;
    }
    header("Location: ../../presentacion/feriado/listarFeriados.php");   
}
?>	
