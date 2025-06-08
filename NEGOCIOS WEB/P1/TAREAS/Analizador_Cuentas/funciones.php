<?php
function extraerCuentas($texto) {
    
    $partes = preg_split('/[^\d-]+/', $texto);

    $cuentas = array_filter($partes, function($item) {
        return preg_match('/\d/', $item);
    });

    return array_values($cuentas); 
}

function guardarEnJson($textoOriginal, $cuentas) {
    $archivo = 'GuarText.json';
    $nuevoRegistro = [
        'fecha' => date('Y-m-d H:i:s'),
        'texto_original' => $textoOriginal,
        'cuentas_encontradas' => $cuentas
    ];

    $data = [];
    if (file_exists($archivo)) {
        $contenido = file_get_contents($archivo);
        $data = json_decode($contenido, true);
        if (!is_array($data)) {
            $data = [];
        }
    }

    $data[] = $nuevoRegistro;
    file_put_contents($archivo, json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
}

