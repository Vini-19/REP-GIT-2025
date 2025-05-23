<?php
$strNombre= "ING Marco Vinicio Sanchez";
$intEdad= 35;
$strCorreo= "sanch@example.com";    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>PHP NEGOCIOS WEB</h1>
    <?php 
    echo "Hola muy buenos dias";
    echo "<br>";
    echo "Estos son mis datos personales";
    echo "<br>";
    echo $strNombre;
    echo "<br>";
    echo "<a>Edad</a> ".$intEdad;
    echo "<br>";
    echo "<a>Correo</a> ".$strCorreo;
    ?>
</body>
</html>