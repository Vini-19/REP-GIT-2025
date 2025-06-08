<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reserva en Vini Hotel Beach</title>
    <link rel="stylesheet" href="style/style.css">
</head>
<body>

    <div class="contenedor-reserva">
        <h2 class="titulo-principal">Vini Hotel Beach</h2>
        <p class="mensaje-bienvenida">Relájate junto al mar en la bella isla de Roatán</p>
        
        <form action="Procesar_Pago.php" method="POST" class="formulario-reserva">
            <input type="text" name="nombre_completo" placeholder="Nombre completo" required>
            
            <select name="habitacion" required>
                <option value="">Elige una habitación</option>
                <option value="estandar">Estándar - L.850</option>
                <option value="premium">Premium - L.1250</option>
                <option value="vip">VIP Frente al Mar - L.1750</option>
            </select>

            <input type="number" name="huespedes" placeholder="N° de huéspedes" min="1" required>
            <input type="number" name="cuartos" placeholder="Cantidad de cuartos" min="1" required>

            <select name="vista_mar" required>
                <option value="">¿Vista al océano?</option>
                <option value="si">Sí - L.300 por cuarto</option>
                <option value="no">No, gracias</option>
            </select>

            <select name="incluye_desayuno" required>
                <option value="">¿Incluir desayuno?</option>
                <option value="si">Sí - L.150 por persona</option>
                <option value="no">No</option>
            </select>

            <input type="number" name="noches" placeholder="Días de estadía" min="1" required>

            <button type="submit" class="boton-reservar">Confirmar Reserva</button>
        </form>
    </div>

</body>
</html>
