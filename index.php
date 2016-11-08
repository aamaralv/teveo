<html> 

<!--
// UDE - Ingeniería en Informática - Desarrollo de Aplicaciones PHP - Curso 2016
// Integrantes : Alexander Amaral
//               Gaston Rodriguez
//               Victorio Cecot
//
--> 

  <head> 
    <title>Autenticación</title> 
    <style type="text/css">
      .auto-style1 {
        text-align: center;
      }
    </style>
  </head> 
  <body onLoad="document.formulario.usuario.focus()"> 
    <h1><br><br></h1>
    <h1 class="auto-style1">Autenticación</h1> 
    <form name="formulario" action="seguridad/control.php" method="POST"> 
    <table align="center" width="225" cellspacing="2" cellpadding="2" border="0"> 
      <tr> 
        <td colspan="2" align="center">

          <?php
            if(isset($_GET["errorusuario"]))
            {
              if ($_GET["errorusuario"]=="si")
              { 
                echo "<b>Datos incorrectos</b>"; 
              }
              else
              {
				if ($_GET["errorusuario"]=="us")
				{
				  echo "<b>Introduzca usuario</b>"; 
				}
				else
				{
				  if ($_GET["errorusuario"]=="co")
				  {
					  echo "<b>Omitio la contraseña</b>";
				  }
				}
			  }
            }
          ?>
		  
        </td> 
      </tr> 
      <tr> 
        <td align="right">Usuario:</td> 
        <td><input type="Text" name="usuario" size="12" maxlength="50" autocomplete="off"></td> 
      </tr> 
      <tr> 
        <td align="right">Contraseña:</td> 
        <td><input type="password" name="contrasena" size="12" maxlength="50"></td> 
      </tr> 
      <tr> 
        <td colspan="2" align="center"><input type="Submit" value="ENTRAR"></td> 
      </tr> 
    </table> 
    </form> 
  </body> 
</html> 
