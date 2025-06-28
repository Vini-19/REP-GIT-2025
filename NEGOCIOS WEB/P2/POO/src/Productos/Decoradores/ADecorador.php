<?php

namespace Nws\Productos\Decoradores;

abstract class ADecorador
{
    private float $valor;
    private EtipoOperacion $operacion;
    private string $name;

    public function __construct(float $valor,string $name, EtipoOperacion $operacion)
    {
        if (
            $operacion == EtipoOperacion::SumaPorcentaje
            || $operacion == EtipoOperacion::SumaPorcentajeRaiz
        ) {
            if ($valor < -1 || $valor > 1) {
                throw new \Exception("Rango para Porcentaje es entre -1");
            }
        }

        $this->valor = $valor;
        $this->operacion = $operacion;
        $this->name = $name;
    }

    public function getprecio(float $precioBase, float $precioActual)
    {
        switch ($this->operacion) {
            case EtipoOperacion::SumaValor:
                return $precioBase + $this->valor;
            case EtipoOperacion::SumaPorcentaje:
                return $precioActual * (1 + $this->valor);
            case EtipoOperacion::SumaPorcentajeRaiz:
                return $precioActual + ($precioBase * $this->valor);
        }
    }

    public function getName()
    {
        return $this->name;
    }
}