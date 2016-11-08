<?php

include_once("tipotarea.php");

$tarea;
$mensaje="";
if (obtener_tarea(4, $tarea, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST OBTENER TAREA <br>";
    echo $tarea['id'], $tarea['nombre'], $tarea['habilitado']."<br>";;
}


$tareas;
if (listar_tareas($tareas, $mensaje)) {
    echo $mensaje . "<br>";
} else {
    echo "TEST LISTAR TAREAS <br>";
    foreach ($tareas as $key => $value) {
        echo $value['id'], $value['nombre'], $value['habilitado']."<br>";
    }
}

?>