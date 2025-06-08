<?php 
    $StString = "";
<<<<<<< HEAD

    if (isset($_POST['imprimir'])) {
        for ($i = 5; $i >= 1; $i--) {
            $StString .= "Hola mundo $i<br>";
        }
    }

=======
    $StLimpiar = "";

    if (isset($_POST['limpiar'])){
        $StString="";
    }


   if (isset($_POST['imprimir'])) {
    for ($i = 5; $i >= 1; $i--) {
        $StString .= "$i Hola mundo<br>";
    }

}

>>>>>>> d45833f439258491134e6e9add41648c5ef8e464
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ciclos Simples</title>
</head>
<body>
    <form method="post">
        <button type="submit" name="imprimir">Imprimir</button>
<<<<<<< HEAD
=======
        <button type="submit" name="limpiar">limpiar</button>

>>>>>>> d45833f439258491134e6e9add41648c5ef8e464
    </form>
    <?php
        echo $StString;
    ?>
</body>
</html>