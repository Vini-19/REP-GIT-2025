<?php 

// Definicion de variables
 $intN1 = 0;
 $intN2 = 0;
 $resultado = '';
 $Limpiador = '';


 if(isset($_POST["intN1"])){
        $intN1 = floatval($_POST["intN1"]);
        $intN2 = floatval($_POST["intN2"]);
 }


    if (isset($_POST["BtnSuma"])) {
       $resultado = "La suma de " . $intN1 ." + " . $intN2 ."es igual a " . ($intN1 + $intN2) . "";
   }
 
    if (isset($_POST["BtnResta"])) {
      $resultado = "La resta de " . $intN1 ." - " . $intN2 . " es igual a " . ($intN1 - $intN2) . "";
    }

    if (isset($_POST["BtnMulti"])) {
       $resultado = "La Multiplicación de " . $intN1 ." x " . $intN2 . " es igual a " . ($intN1 * $intN2) . "";
     }

     if (isset($_POST["BtnDiv"])) {
        if ($intN2 == 0){
            $resultado = "No se puede dividir entre 0";
        }else{
            $resultado = "La División de " . $intN1 ." / " . $intN2 . " es igual a " . ($intN1 / $intN2) . "";
        }
     }
    if (isset($_POST["btnLimpiar"])) {
        $resultado = "Ingrese la nueva oparecion matematica";
        $intN1 = 0;
        $intN2 = 0;
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculadora</title>
</head>
<body>
    <h1>CALCULADORA MATEMATICA</h1>
    <form action="Calculadora.php" method="post">
        
        <fieldset>
            <legend>Ingrese los Numeros a calcular</legend>
            <label for="intN1"> Numero 1</label>
            <input type="number" name="intN1" id="intN1" value="<?php echo $intN1; ?>" required>
            <br />
            <label for="intN2"> Numero 1</label>
            <input type="number" name="intN2" id="intN2" value="<?php echo $intN2; ?>" required>
            <input type="submit" name="btnLimpiar" value="limpiar" />
        </fieldset>
        <fieldset>
            <legend>Tipo de Operacion Matematica</legend>
            <input type="submit" name="BtnSuma" value="Suma" />
            <br />
            <input type="submit" name="BtnResta" value="Resta" />
            <br />
            <input type="submit" name="BtnMulti" value="Multiplicar" />
            <br />
            <input type="submit" name="BtnDiv" value="División" />
            <br />
        </fieldset>
    </form>
    <div style = "border:solid 1px #000; padding:1em">
        <?php echo $resultado; ?>
    </div>
</body>
</html>