<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Analizador de Numeros</title>
</head>
<body>
    <h2>Ingresa tus datos</h2>
    <p>Toda la información será guardada separando datos numéricos o números de cuentas</p>

    <form method="post">
        <label>Ingresa el texto:</label><br>
        <textarea name="texto" rows="8" cols="60" required></textarea><br><br>
        <input type="submit" value="Extraer">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        include "funciones.php";

        $mensaje = $_POST["texto"];
        $numerosDetectados = detectarNumeros($mensaje);

        guardarEnArchivoJson($mensaje, $numerosDetectados);

        if (!empty($numerosDetectados)) {
            echo "<ul>";
            
            echo "</ul>";
        } else {
            echo "No se encontraron coincidencias.";
        }

        echo "Información guardada.";
    }
    ?>
</body>
</html>
