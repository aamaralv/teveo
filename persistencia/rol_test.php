<?php

include_once("rol.php");

$rol;
$mensaje="";
if (obtener_rol(4, $rol, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST OBTENER ROL <br>";
    echo $rol['id'], $rol['nombre'], $rol['habilitado']."<br>";;
}


$roles;
if (listar_roles($roles, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST LISTAR ROLES <br>";
    foreach ($roles as $key => $value) {
        echo $value['id'], $value['nombre'], $value['habilitado']."<br>";
    }
}

?>