<?php
$nombreArchivo = "registros.json";
$listaPersonas = file_exists($nombreArchivo)
    ? json_decode(file_get_contents($nombreArchivo), true)
    : [];
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Inscritos</title>
</head>
<body>
    <h1>Registros Exitosos</h1>

    <?php if (count($listaPersonas) == 0): ?>
    <p>No hay registros todavía.</p>
<?php else: ?>
    <table border="1" cellpadding="5">
        <tr>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Teléfono</th>
            <th>Género</th>
            <th>Redes Sociales</th>
            <th>Comentarios</th>
            <th>Idiomas</th>
            <th>Intereses</th>
        </tr>
        <?php foreach ($listaPersonas as $persona): ?>
            <tr>
                <td><?php echo $persona["nombre"]; ?></td>
                <td><?php echo $persona["correo"]; ?></td>
                <td><?php echo $persona["telefono"]; ?></td>
                <td><?php echo $persona["genero"]; ?></td>
                <td><?php echo $persona["redes"]; ?></td>
                <td><?php echo $persona["comentarios"]; ?></td>
                <td><?php echo $persona["idiomas"]; ?></td>
                <td><?php echo $persona["intereses"]; ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
<?php endif; ?>


    <p><a href="Registro.php">Volver al formulario</a></p>
</body>
</html>
