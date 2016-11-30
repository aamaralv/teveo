<?php
include_once("../../persistencia/rol.php");

function listar_roles_logica(&$roles, &$mensaje) {
    $campos=array("id","nombre");	
    $criterios=array();
    $error=listar_roles($campos,$criterios,$roles, $mensaje);
    return $error; 
}

?>	
