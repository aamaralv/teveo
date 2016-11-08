<?php

include_once("cliente.php");




$mensaje = "";
if (insertar_cliente("pepe", "toto", "23345", "xxxx", 1, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST ALTA CLIENTE <br>";
    echo $mensaje . "<br>";
}

if (insertar_cliente("pepe", "toto", "23345", "xxxx", 1, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST ALTA CLIENTE <br>";
    echo $mensaje . "<br>";
}


$cliente;
if (obtener_cliente(4, $cliente, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST OBTENER CLIENTE <br>";
    echo $cliente['id'], $cliente['nombre'], $cliente['apellido'], $cliente['telefono'],
    $cliente['direccion'], $cliente['habilitado'] . "<br>";
}


if (actualizar_cliente(4, "ZZZZ2", "zzzz2", "999992", "IIIII2", 1, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST ACTUALIZAR CLIENTE <br>";
    echo $mensaje . "<br>";
}


if (borrar_cliente(3, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST ELIMINAR CLIENTE <br>";
    echo $mensaje . "<br>";
}


$clientes;
if (listar_clientes($clientes, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST LISTAR CLIENTES <br>";
    foreach ($clientes as $key => $value) {
        echo $value['id'], $value['nombre'], $value['apellido'], $value['telefono'],
        $value['direccion'], $value['habilitado'] . "<br>";
    }
}
?>