<?php

include_once("empleado.php");




$mensaje = "";
if(insertar_empleado("42348748", "yyyyy1", "Alex", "099168762", "xxxx1", 1, "paloypalo", "aamaral", 1, $mensaje)){
    echo $mensaje . "<br>";
} else {
    echo "TEST ALTA EMPLEADO <br>";
    echo $mensaje . "<br>";
}

if (borrar_empleado("42348748", $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST ELIMINAR EMPLEADO <br>";
    echo $mensaje . "<br>";
}

if(insertar_empleado("42348748", "yyyyy1", "Alex", "099168762", "xxxx1", 1, "paloypalo", "aamaral", 1, $mensaje)){
    echo $mensaje . "<br>";
} else {
    echo "TEST ALTA EMPLEADO <br>";
    echo $mensaje . "<br>";
}


$empleado;
if (obtener_empleado("42348748", $empleado, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST OBTENER EMPLEADO <br>";
    echo $empleado['ci'] ,
    $empleado['identificador'],
    $empleado['nombre'] ,
    $empleado['telefono'] ,
    $empleado['identificadorequipo'] ,
    $empleado['rolid'] ,
    $empleado['password'] ,
    $empleado['login'] ,
    $empleado['habilitado'] ."<br>";
}


if (actualizar_empleado("42348748", "yyyyy1", "Alexander", "099168762", "xxxx1", 1, "paloepalo", "aamaralvaldez", 1, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST ACTUALIZAR EMPLEADO <br>";
    echo $mensaje . "<br>";
}
$empleado;
if (obtener_empleado("42348748", $empleado, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST OBTENER EMPLEADO <br>";
    echo $empleado['ci'] ,
    $empleado['identificador'],
    $empleado['nombre'] ,
    $empleado['telefono'] ,
    $empleado['identificadorequipo'] ,
    $empleado['rolid'] ,
    $empleado['password'] ,
    $empleado['login'] ,
    $empleado['habilitado'] ."<br>";
}


$empleados;
if (listar_empleados($empleados, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST LISTAR EMPLEADOS <br>";
    foreach ($empleados as $key => $empleado) {
           echo $empleado['ci'] ,
    $empleado['identificador'],
    $empleado['nombre'] ,
    $empleado['telefono'] ,
    $empleado['identificadorequipo'] ,
    $empleado['rolid'] ,
    $empleado['password'] ,
    $empleado['login'] ,
    $empleado['habilitado'] ."<br>";
    }
}
?>