<?php

include_once("../persistencia/ordendetrabajo.php");
/*
 * La url para prueba depende de donde se esta corriendo el proyecto
 * ejemplo
  http://localhost:8080/teveoremoto/teveorepo/ws/index.php/ordendetrabajo
  Para esta entrega utilizar la siguiente url
  http://localhost:8080/teveo/ws/index.php/ordendetrabajo
 * 
 * Json de prueba con chrome-browser-rest-client
 *  
 * request
  {"tipoorden":"T",
 "tipotareaid":1,"sistemaemisor":"prueba","tipoproductoid":1,"fechahoracreacion":20160101,"usuariocreador":"prueba",
  "fechahoradistribucion":20160101,
  "fechaprevista":20160101,
  "identificadorsupervisor":"xxx1",
  "identificadorempleado":"xxx2",
  "fechacancelacion":20160101,
  "nombrecliente":"prueba",
  "direccion":"prueba",
  "localidad":"prueba",
  "departamento":"prueba",
  "fechahoradespacho":20160101,
  "comentariosupervisor":"holaaaa",
  "equipodespacho":"algo",
  "fechahoracierre":20160101,
  "comentarioscierre":"cerrooo",
  "estado":"quedo",
  "codigozona":"rrr",
  "prioridad":1,
  "funcionesrequeridas":3}
  
 * response
 *{mensaje:'Se realizo el registro con exito' datos:'Array\n(\n    [0] => 'T'\n    
 * [1] => 1\n    [2] => 'prueba'\n    [3] => 1\n    
 * [4] => 20160101\n    [5] => 'prueba'\n    [6] => 20160101\n    
 * [7] => 20160101\n    [8] => 'xxx1'\n    [9] => 'xxx2'\n    
 * [10] => 20160101\n    [11] => 'prueba'\n    [12] => 'prueba'\n    
 * [13] => 'prueba'\n    [14] => 'prueba'\n    [15] => 20160101\n    
 * [16] => 'holaaaa'\n    [17] => 'algo'\n    [18] => 20160101\n    
 * [19] => 'cerrooo'\n    [20] => 'quedo'\n    [21] => 'rrr'\n    
 * [22] => 1\n    [23] => 3\n)\n'.}"
 * 
 * 
 *  */

//incluir el archivo principal
include("Slim/Slim.php");

//registran la instancia de slim
\Slim\Slim::registerAutoloader();
//aplicacion 
$app = new \Slim\Slim();

$app->post('/ordendetrabajo', function () use ($app) {
    try {
        // get and decode JSON request body
        $request = $app->request();
        $body = $request->getBody();
        $input = json_decode($body);

        $campos = array(
            "tipoorden",
            "tipotarea",
            "sistemaemisor",
            "tipoproducto",
            "fechahoracreacion",
            "usuariocreador",
            "fechahoradistribucion",
            "fechaprevista",
            "identificadorsupervisor",
            "equipo",
            "fechacancelacion",
            "nombrecliente",
            "direccion",
            "localidad",
            "departamento",
            "fechahoradespacho",
            "comentariosupervisor",
            "equipodespacho",
            "fechahoracierre",
            "comentarioscierre",
            "estado",
            "codigozona",
            "prioridad",
            "funcionesrequeridas");


        $tipoorden = $input->tipoorden;
        $tipotareaid = $input->tipotareaid;
        $sistemaemisor = $input->sistemaemisor;
        $tipoproductoid = $input->tipoproductoid;
        $fechahoracreacion = $input->fechahoracreacion;
        $usuariocreador = $input->usuariocreador;
        $fechahoradistribucion = $input->fechahoradistribucion;
        $fechaprevista = $input->fechaprevista;
        $identificadorsupervisor = $input->identificadorsupervisor;
        $identificadorempleado = $input->identificadorempleado;
        $fechacancelacion = $input->fechacancelacion;
        $nombrecliente = $input->nombrecliente;
        $direccion = $input->direccion;
        $localidad = $input->localidad;
        $departamento = $input->departamento;
        $fechahoradespacho = $input->fechahoradespacho;
        $comentariosupervisor = $input->comentariosupervisor;
        $equipodespacho = $input->equipodespacho;
        $fechahoracierre = $input->fechahoracierre;
        $comentarioscierre = $input->comentarioscierre;
        $estado = $input->estado;
        $codigozona = $input->codigozona;
        $prioridad = $input->prioridad;
        $funcionesrequeridas = $input->funcionesrequeridas;

        $valores = array(
            "'$tipoorden'",
            $tipotarea,
            "'$sistemaemisor'",
            $tipoproducto,
            $fechahoracreacion,
            "'$usuariocreador'",
            $fechahoradistribucion,
            $fechaprevista,
            "'$identificadorsupervisor'",
            "'$identificadorempleado'",
            $fechacancelacion,
            "'$nombrecliente'",
            "'$direccion'",
            "'$localidad'",
            "'$departamento'",
            $fechahoradespacho,
            "'$comentariosupervisor'",
            "'$equipodespacho'",
            $fechahoracierre,
            "'$comentarioscierre'",
            "'$estado'",
            "'$codigozona'",
            $prioridad,
            $funcionesrequeridas);
        $mensaje = "";

        insertar_orden_de_trabajo($campos, $valores, $mensaje);


        $app->response()->header('Content-Type', 'application/json');
        $var = print_r($valores, true);
        echo json_encode("{mensaje:'$mensaje' datos:'$var'.}");
    } catch (Exception $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', $e->getMessage());
    }
}
);

//inicializamos la aplicacion(API)
$app->run();

