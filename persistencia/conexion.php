<?php

/*define("DB_HOST", "mysql13.000webhost.com");
define("DB_USER", "a3042567_user01");
define("DB_PASS", "user01");
define("DB_NAME", "a3042567_bd");*/

define("DB_HOST", "localhost");
define("DB_USER", "root");
define("DB_PASS", "admin");
define("DB_NAME", "teveo");

function abrir_conexion() {
    $cnx = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    if (!$cnx) {
        echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
        echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
        echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;

        exit;
    }
    return $cnx;
}
function cerrar_conexion ( $conexion ){
mysqli_close ( $conexion );
}

?>