<?php

include_once("equipohabilidad.php");




$mensaje = "";
if(insertar_equipo_habilidad(1, "xxxx1", $mensaje)){
    
} else {
    echo "TEST ALTA EQUIPO HABILIDAD <br>";
    echo $mensaje . "<br>";
}

if(borrar_equipo_habilidad(1, "xxxx1", $mensaje)){
    
} else {
    echo "TEST BAJA EQUIPO HABILIDAD <br>";
    echo $mensaje . "<br>";
}


?>