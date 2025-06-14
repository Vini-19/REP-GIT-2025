<?php
require_once "fun.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $datosReserva = [
    'nombre_cliente' => $_POST['nombre_completo'] ?? '',
    'num_personas' => isset($_POST['huespedes']) ? (int)$_POST['huespedes'] : 1,
    'num_cuartos' => isset($_POST['cuartos']) ? (int)$_POST['cuartos'] : 1,
    'tipo_hab' => isset($_POST['tipo_habitacion']) ? $_POST['tipo_habitacion'] : 'estandar',
    'vista_mar' => $_POST['vista_mar'] ?? 'no',
    'incluye_desayuno' => $_POST['incluye_desayuno'] ?? 'no',
    'num_noches' => isset($_POST['noches']) ? (int)$_POST['noches'] : 1
];

    $montos = calcularTotal($datosReserva);

    guardarReservaJSON($datosReserva, $montos);

    echo "<h2>Reserva confirmada en Vini Hotel Beach</h2>";
    imprimirResumenReserva($datosReserva, $montos);

    echo "<p><a href='index.php'>&laquo; Volver al formulario</a></p>";
} else {
    exit("Acceso denegado.");
}
?>
