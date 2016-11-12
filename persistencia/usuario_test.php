<?php

include_once("usuario.php");




$mensaje = "";
$campos=array("ci","usuario","password","nombre","apellido","telefono","rolid","identificadorsupervisor","identificadorequipo","habilitado");
$usuario="aamaral";
$password="admin";
$criterios=array("usuario='$usuario'","password='$password'");


$usuario_aux;
if (login_usuario($campos,$criterios,$usuario_aux,$mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST OBTENER USUARIO <br>";
    echo $usuario_aux['ci'] ,
    $usuario_aux['usuario'],
    $usuario_aux['password'] ,
    $usuario_aux['nombre'] ,
    $usuario_aux['apellido'] ,
    $usuario_aux['telefono'] ,
    $usuario_aux['rolid'] ,
    $usuario_aux['identificadorsupervisor'] ,
    $usuario_aux['habilitado'] ,
    $usuario_aux['identificadorequipo'] ."<br>";
}



$campos=array("ci","usuario","password","nombre","apellido","telefono","rolid","identificadorsupervisor","identificadorequipo","habilitado");
$valores=array("'12223334'","'totin'","'totin'","'totin'","'totin'","'11111'",1,"'-'","'-'",1);
if(insertar_usuario($campos,$valores, $mensaje)){
    echo $mensaje . "<br>";
} else {
    echo "TEST ALTA USUARIO <br>";
    echo $mensaje . "<br>";
}

$usuario_auxs;
$campos=array("ci","usuario","password","nombre","apellido","telefono","rolid","identificadorsupervisor","identificadorequipo","habilitado");
$criterios=array();
if (listar_usuarios($campos,$criterios,$usuario_auxs, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST LISTAR EMPLEADOS <br>";
    foreach ($usuario_auxs as $key => $usuario_aux) {
           echo $usuario_aux['ci'] ,
    $usuario_aux['usuario'],
    $usuario_aux['password'] ,
    $usuario_aux['nombre'] ,
    $usuario_aux['apellido'] ,
    $usuario_aux['telefono'] ,
    $usuario_aux['rolid'] ,
    $usuario_aux['identificadorsupervisor'] ,
    $usuario_aux['habilitado'] ,
    $usuario_aux['identificadorequipo'] ."<br>";
    }
}


$nombre="pepote";
$apellido="pepote"; 
$habilitado=1;
$valores=array("nombre='$nombre'","apellido='$apellido'","habilitado=$habilitado");
$ci="12223334";
$usuario="totin";
$criterios=array("ci='$ci'","usuario='$usuario'");
if (actualizar_usuario($valores,$criterios,$mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST ACTUALIZAR USUARIO <br>";
    echo $mensaje . "<br>";
}

$usuario_auxs;
$campos=array("ci","usuario","password","nombre","apellido","telefono","rolid","identificadorsupervisor","identificadorequipo","habilitado");
$criterios=array();
if (listar_usuarios($campos,$criterios,$usuario_auxs, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST LISTAR USUARIOS <br>";
    foreach ($usuario_auxs as $key => $usuario_aux) {
           echo $usuario_aux['ci'] ,
    $usuario_aux['usuario'],
    $usuario_aux['password'] ,
    $usuario_aux['nombre'] ,
    $usuario_aux['apellido'] ,
    $usuario_aux['telefono'] ,
    $usuario_aux['rolid'] ,
    $usuario_aux['identificadorsupervisor'] ,
    $usuario_aux['habilitado'] ,
    $usuario_aux['identificadorequipo'] ."<br>";
    }
}
$ci="12223334";
$criterios=array("ci='$ci'");
if (borrar_usuario($criterios,$mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST BORRAR USUARIO <br>";
    echo $mensaje . "<br>";
}

?>