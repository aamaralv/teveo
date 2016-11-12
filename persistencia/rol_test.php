<?php

include_once("rol.php");

$rol;
$mensaje="";

$campos=array("id","nombre");
$criterios=array();
//$ci=222;
//$criterios=array("ci=$ci");
//$nombre="aaa";
//$criterios=array("ci=$ci","nombre='$nombre'");



$roles;
if (listar_roles($campos,$criterios,$roles, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST LISTAR ROLES <br>";
    foreach ($roles as $key => $value) {
        echo $value['id'], $value['nombre']."<br>";
    }
}

?>