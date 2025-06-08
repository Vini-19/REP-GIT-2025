<?php
$errores = [];
$persona = [];
$nombreArchivo = "registros.json";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $nombresCampos = [
        "nombre", "correo", "contrasena", "telefono",
        "genero", "redes", "comentarios", "idiomas"
    ];

    foreach ($nombresCampos as $campo) {
        if (empty($_POST[$campo])) {
            $errores[] = "El campo '$campo' es obligatorio.";
        } else {
            $persona[$campo] = htmlspecialchars($_POST[$campo]);
        }
    }

    $persona["intereses"] = isset($_POST["intereses"])
        ? implode(", ", $_POST["intereses"])
        : "";

    if (empty($errores)) {
        $listaPersonas = file_exists($nombreArchivo)
            ? json_decode(file_get_contents($nombreArchivo), true)
            : [];

        $listaPersonas[] = $persona;
        file_put_contents($nombreArchivo, json_encode($listaPersonas, JSON_PRETTY_PRINT));
        header("Location: ListRegistro.php");
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Inscripción - Centro de Antigüedades</title>
    <link rel="stylesheet" href="./styles/styregistro.css">
</head>
<body>
    <h1>Formulario de Inscripción</h1>

    <?php if (!empty($errores)): ?>
        <div style="color:red;">
            <ul>
                <?php foreach ($errores as $mensaje): ?>
                    <li><?= $mensaje ?></li>
                <?php endforeach; ?>
            </ul>
        </div>
    <?php endif; ?>

    <form method="post" action="Registro.php">
        <label>Nombre completo:
            <input type="text" name="nombre" required>
        </label><br>

        <label>Correo electrónico:
            <input type="email" name="correo" required>
        </label><br>

        <label>Contraseña:
            <input type="password" name="contrasena" required>
        </label><br>

        <label>Número de teléfono:
            <input type="text" name="telefono" required>
        </label><br>

        <label>Intereses:<br>
            <input type="checkbox" name="intereses[]" value="muebles antiguos"> Muebles antiguos<br>
            <input type="checkbox" name="intereses[]" value="joyería vintage"> Joyería vintage<br>
            <input type="checkbox" name="intereses[]" value="arte clásico"> Arte clásico<br>
        </label><br>

        <label>Género:
            <select name="genero" required>
                <option value="">Seleccione</option>
                <option value="Femenino">Femenino</option>
                <option value="Masculino">Masculino</option>
            </select>
        </label><br>

        <label>Redes Sociales
            <input type="text" name="redes"  required>
        </label><br>

        <label>Comentarios/Intereses Específicos:<br>
            <textarea name="comentarios" rows="4" cols="50" required></textarea>
        </label><br>

        <label>Idiomas:
            <input type="text" name="idiomas" placeholder="Ej: Español, Inglés" required>
        </label><br>

        <button type="submit">Enviar Registro</button>
        <button class="ver_list" onclick="location.href='ListRegistro.php'">Ver Listado</button>
    </form>
</body>
</html>
