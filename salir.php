<?php

// UDE - Ingeniería en Informática - Desarrollo de Aplicaciones PHP - Curso 2016
// Integrantes : Alexander Amaral
//               Gaston Rodriguez
//               Victorio Cecot
//

include ("seguridad/seguridad.php");
session_destroy(); 
?> 
<html> 
  <head> 
    <title>Has salido!!</title>
    <style type="text/css">
      .auto-style1 {
        text-align: center;
      }
    </style> 
  </head> 
  <body class="auto-style1"> 
    <h1><br><br></h1>
    <h3>Gracias por su acceso</h1> 
    <br> 
    <br> 
    <a href="index.php">Formulario de autentificación</a> 
  </body> 
</html>
