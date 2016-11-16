<?php
include_once("../persistencia/habilidad.php");

function listar_habilidades_logica(&$habilidades, &$mensaje) {
    $campos=array("id","codigo","descripcion");	
    $criterios=array();
    listar_habilidades($campos,$criterios,$habilidades, $mensaje);
    
}


function modificar_habilidades_logica($id,$codigo,$descripcion, &$mensaje) {
    $valores=array("id=".$id,"codigo='".$codigo."'","descripcion='".$descripcion."'");	
    $criterios=array("id=".$id);
   // function actualizar_habilidad($valores,$criterios,&$mensaje) {
    actualizar_habilidad($valores,$criterios,$mensaje);
    
}


if (isset($_POST['Modificar_Habilidad'])) {
    $id = $_POST["id"];
    $codigo = $_POST["codigo"];
    $descripcion = $_POST["descripcion"];
    $mensaje = "";

    modificar_habilidades_logica($id,$codigo,$descripcion, $mensaje);
    header("Location: ../presentacion/listarhabilidades.php");
}
?>	
