<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>INF</title>
</head>
<body>
    <h2>Ingresa tu datos</h2>
    <p>Toda la Información sera guardada separando datos numericos o numeros de cuentas</p>

    <form method="post">
        <label>Ingresa el texto:</label><br>
        <textarea name="texto" rows="8" cols="60" required></textarea><br><br>
        <input type="submit" value="Extraer">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        include "funciones.php";

        $texto = $_POST["texto"];
        $cuentas = extraerCuentas($texto);

        guardarEnJson($texto, $cuentas);

        echo "Gracias por preferirnos :";

        if (!empty($cuentas)) {
        } else {
            echo "No se encontraron coincidencias.";
        }

        echo "Información guardada.";
    }
    ?>
</body>
</html>
