<?php
define("TABLA_TIPO_DE_ROL", "rol");
define("TABLA_EMPLEADO", "empleado");
define("TABLA_EQUIPO", "equipo");
define("TABLA_HABILIDAD", "habilidad");
define("TABLA_ORDEN_DE_TRABAJO", "orden_de_trabajo");
define("TABLA_TIPOS_DE_PRODUCTO", "tipso_de_producto");
define("TABLA_TIPOS_DE_TAREA", "tipos_de_tarea");
define("TABLA_AUDITORIA_CUOTA", "auditoria_cuota");
define("TABLA_CUOTA_EXCEPCIONAL", "cuota_excepcional");
define("TABLA_FERIADO", "feriados");

function select($conexion, $tabla, $campos, $criterios, &$tabla_resultado, &$mensaje_error) {

    $error = false;
    $selectcampos = implode(",", $campos);

    $consulta = "SELECT " . $selectcampos . " FROM " . $tabla;
   
    if (!empty($criterios)) {
        $selectwhere = implode(" and ", $criterios);
        $consulta.=" WHERE " . $selectwhere;
    }
																												
    $resultado = mysqli_query($conexion, $consulta);

    if (!$resultado) {
        $error = true;
        $mensaje = mysqli_error($conexion);
        $mensaje_error = 'Mensaje de error: [' . $mensaje . ']';
    } else {
        $cantreg = mysqli_num_rows($resultado);
        $tabla_resultado = array();
        for ($i = 0; $i < $cantreg; $i++) {
            $tabla_resultado[$i] = mysqli_fetch_array($resultado);
        }
        // if ($cantreg == 1) {
        //     $tabla_resultado = $tabla_resultado[0];
        // }
        
    }
    return $error;
}

function consultarEnBD($conexion, $tabla, $campos, $criterios){
	$consulta = "SELECT " . $campos .  " FROM " . $tabla . " WHERE " . $criterios;
	$resultado = mysqli_query($conexion, $consulta);
	if (!$resultado){
		die ("Error en la consulta 2: $consulta");
		$cantidad = 0;
	}
	else
		$cantreg = mysqli_num_rows($resultado);
	$tabla = array();
	for ($i=0; $i < $cantreg; $i++)
		$tabla[$i] = mysqli_fetch_array ($resultado);
	return $tabla;
}

function insert($conexion, $tabla, $campos, $valores,&$mensaje, &$nroOrdenGenerada) {
    $error = false;
    $insertcampos = implode(",", $campos);
    $insertvalores = implode(",", $valores);
    $insert = "INSERT INTO " . $tabla . "(" . $insertcampos . ") VALUES (" . $insertvalores . ")";

    if (!mysqli_query($conexion, $insert)) {
        $mensaje = mysqli_error($conexion);
        $mensaje = 'Mensaje de error: [' . $mensaje . ']';
        $error = true;
		$nroOrdenGenerada = "-1";
    } else {
        $mensaje = 'Se realizo el registro con exito';
		$nroOrdenGenerada = mysqli_insert_id($conexion);
	}

    return $error;
}

function update($conexion, $tabla, $valores,$criterios,&$mensaje) {
    $error = false;
    $updatevalores = implode(",", $valores);
    $updatewhere = implode(" and ", $criterios);
    $update = "UPDATE " . $tabla ." SET " . $updatevalores . " WHERE " . $updatewhere;
    echo $update;

																														$salida = 'funciones_BD_php-update.txt';
																														file_put_contents($salida, $update);		

    if (!mysqli_query($conexion, $update)) {
        $mensaje = mysqli_error($conexion);
        $mensaje = 'Mensaje de error: [' . $mensaje . ']';
        $error = true;
    } else {
        $mensaje = 'El registo fue actualizado con exito';
    }

    return $error;
}

function delete($conexion, $tabla, $criterios,&$mensaje) {
    $error = false;
    $deletewhere = implode(" and ", $criterios);
    $delete = "DELETE FROM " . $tabla . " WHERE " . $deletewhere;
    
    if (!mysqli_query($conexion, $delete)) {
        $mensaje = mysqli_error($conexion);
        $mensaje = 'Mensaje de error: [' . $mensaje . ']';
        $error = true;
    } else {
        $mensaje = 'El resgistro fue borrado con exito';
    }

    return $error;
}


?>