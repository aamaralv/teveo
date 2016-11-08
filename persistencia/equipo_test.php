<?php

include_once("equipo.php");




$mensaje = "";
if(insertar_equipo("xxxx1", 1, 5, 5, 5, 5, $mensaje)){
    echo $mensaje . "<br>";
} else {
    echo "TEST ALTA EQUIPO <br>";
    echo $mensaje . "<br>";
}

if (borrar_equipo("xxxx1", $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST ELIMINAR EQUIPO <br>";
    echo $mensaje . "<br>";
}

if(insertar_equipo("xxxx1", 1, 5, 5, 5, 5, $mensaje)){
    echo $mensaje . "<br>";
} else {
    echo "TEST ALTA EQUIPO <br>";
    echo $mensaje . "<br>";
}


$equipo;
if (obtener_equipo("xxxx1", $equipo, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST OBTENER EQUIPO <br>";
    echo
    $equipo['identificador'],
    $equipo['supervisorid'],
    $equipo['cuotadiaslaborales'],
    $equipo['cuotasabado'],
    $equipo['cuotadomingo'],
    $equipo['cuotaferiado'] . "<br>";
}


if (actualizar_equipo("xxxx1", 1, 6, 6, 6, 6, $mensaje)){
    echo $mensaje . "<br>";
} else {
    echo "TEST ACTUALIZAR EMPLEADO <br>";
    echo $mensaje . "<br>";
}
$equipo;
if (obtener_equipo("xxxx1", $equipo, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST OBTENER EQUIPO <br>";
    echo
    $equipo['identificador'],
    $equipo['supervisorid'],
    $equipo['cuotadiaslaborales'],
    $equipo['cuotasabado'],
    $equipo['cuotadomingo'],
    $equipo['cuotaferiado'] . "<br>";
}


$equipos;
if (listar_equipos($equipos, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST LISTAR EQUIPOS <br>";
    foreach ($equipos as $key => $equipo) {
    echo
    $equipo['identificador'],
    $equipo['supervisorid'],
    $equipo['cuotadiaslaborales'],
    $equipo['cuotasabado'],
    $equipo['cuotadomingo'],
    $equipo['cuotaferiado'] . "<br>";
    }
}
?>