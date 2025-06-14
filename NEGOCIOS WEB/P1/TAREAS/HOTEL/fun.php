<?php
function calcularTotal($datos) {
    $precios = [
        'estandar' => 850,
        'premium' => 1250,
        'vip' => 1750,
        'vista_mar' => 300,
        'desayuno' => 150
    ];

    $tipo = $datos['tipo_hab'];
    if (!isset($precios[$tipo])) {
        $tipo = 'estandar'; 
    }

    $subtotal = $precios[$tipo] * $datos['num_cuartos'] * $datos['num_noches'];

    if ($datos['vista_mar'] === 'si') {
        $subtotal += $precios['vista_mar'] * $datos['num_cuartos'] * $datos['num_noches'];
    }

    if ($datos['incluye_desayuno'] === 'si') {
        $subtotal += $precios['desayuno'] * $datos['num_personas'] * $datos['num_noches'];
    }

    $impuesto = $subtotal * 0.15;
    $cargo_servicio = $subtotal * 0.18;
    $total = $subtotal + $impuesto + $cargo_servicio;

    return [
        'base' => $subtotal,
        'impuesto' => $impuesto,
        'servicio' => $cargo_servicio,
        'total' => $total
    ];
}

function guardarReservaJSON($datos, $montos) {
    $registro = array_merge($datos, $montos);
    $archivo = 'reservas_viniHotelBeach.json';

    $datosGuardados = file_exists($archivo) ? json_decode(file_get_contents($archivo), true) : [];
    $datosGuardados[] = $registro;

    file_put_contents($archivo, json_encode($datosGuardados, JSON_PRETTY_PRINT));
}

function imprimirResumenReserva($info, $montos) {
    echo "
    <h3>Detalle de la Reserva</h3>
    <table border='1' cellpadding='8'>
        <tr>
            <th>Cliente</th><th>Personas</th><th>Cuartos</th><th>Tipo Habitación</th>
            <th>Vista al Mar</th><th>Desayuno</th><th>Noches</th><th>Base</th>
            <th>Impuesto</th><th>Servicio</th><th>Total</th>
        </tr>
        <tr>
            <td>{$info['nombre_cliente']}</td>
            <td>{$info['num_personas']}</td>
            <td>{$info['num_cuartos']}</td>
            <td>{$info['tipo_hab']}</td>
            <td>{$info['vista_mar']}</td>
            <td>{$info['incluye_desayuno']}</td>
            <td>{$info['num_noches']}</td>
            <td>L " . number_format($montos['base'], 2) . "</td>
            <td>L " . number_format($montos['impuesto'], 2) . "</td>
            <td>L " . number_format($montos['servicio'], 2) . "</td>
            <td><strong>L " . number_format($montos['total'], 2) . "</strong></td>
        </tr>
    </table>";
}

?>
