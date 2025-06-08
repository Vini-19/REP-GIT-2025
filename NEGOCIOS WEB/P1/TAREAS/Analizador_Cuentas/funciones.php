<?php
function detectarNumeros($entrada) {
    $segmentos = preg_split('/[^\d-]+/', $entrada);

    $numeros = array_filter($segmentos, function($valor) {
        return preg_match('/\d/', $valor);
    });

    return array_values($numeros);
}

function guardarEnArchivoJson($contenido, $datosNumericos) {
    $rutaArchivo = 'GuarText.json';
    $registroNuevo = [
        'fecha' => date('Y-m-d H:i:s'),
        'texto_original' => $contenido,
        'cuentas_encontradas' => $datosNumericos
    ];

    $contenidoTotal = [];
    if (file_exists($rutaArchivo)) {
        $lectura = file_get_contents($rutaArchivo);
        $contenidoTotal = json_decode($lectura, true);
        if (!is_array($contenidoTotal)) {
            $contenidoTotal = [];
        }
    }

    $contenidoTotal[] = $registroNuevo;
    file_put_contents($rutaArchivo, json_encode($contenidoTotal, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
}
?>
