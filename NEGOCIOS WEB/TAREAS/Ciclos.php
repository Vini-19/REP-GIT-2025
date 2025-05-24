<?php 
    $StString = "";

    if (isset($_POST['imprimir'])) {
        for ($i = 5; $i >= 1; $i--) {
            $StString .= "Hola mundo $i<br>";
        }
    }

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
    </form>
    <?php
        echo $StString;
    ?>
</body>
</html>