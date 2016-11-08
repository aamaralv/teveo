<?php

include_once("tipoproducto.php");

$producto;
$mensaje="";
if (obtener_producto(4, $producto, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST OBTENER PRODUCTO <br>";
    echo $producto['id'], $producto['nombre'], $producto['habilitado']."<br>";;
}


$productos;
if (listar_productos($productos, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST LISTAR PRODUCTOS <br>";
    foreach ($productos as $key => $value) {
        echo $value['id'], $value['nombre'], $value['habilitado']."<br>";
    }
}

?>