<?php

namespace Nws\DAO;
use Nws\DAO\Idata;
use Nws\DAO\Producto;

class Productos {

    private array $Productos;
    private IData $store;
    public function __construct(IData $store){
        $this->store = $store;
        $this->Productos = $this->store->Obtener();
    }

    public function getProductos(): array {
        return $this->Productos;
    }

    public function addProducto(Producto $newProducto){
        $this -> productos[]= $newProducto;
        $this->store->Guardar($this->Productos);

    }
}