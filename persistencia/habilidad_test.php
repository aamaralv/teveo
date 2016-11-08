<?php

include_once("habilidad.php");

$habilidad;
$mensaje="";
if (obtener_habilidad(4, $habilidad, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST OBTENER HABILIDAD <br>";
    echo $habilidad['id'], $habilidad['nombre'], $habilidad['habilitado']."<br>";;
}


$habilidades;
if (listar_habilidades($habilidades, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST LISTAR HABILIDADES <br>";
    foreach ($habilidades as $key => $value) {
        echo $value['id'], $value['nombre'], $value['habilitado']."<br>";
    }
}

?>