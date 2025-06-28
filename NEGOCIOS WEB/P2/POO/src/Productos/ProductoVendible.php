<?php

namespace Nws\Productos;
use Nws\Productos\Decoradores\ADecorador;
use Nws\Productos\DTO\Producto;

class ProductoVendible{
    private Producto $producto;
    private array $decoradores;

    public function __construct(Producto $producto){
        $this -> producto = $producto;
        $this -> decoradores = [];
    }

    public function addDecorador(ADecorador $decorador){
        $this -> decoradores[] = $decorador;
    }

    public function getPrecio(): float {
        $precio = $this->producto->Precio;
        foreach($this -> decoradores as $decorador){
            $precio += $decorador->getPrecio($this -> producto ->Precio,$precio);
        }
        return $precio;
    }
}