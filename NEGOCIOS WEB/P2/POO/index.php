<?php
    require_once 'vendor/autoload.php';
    $helloInstance = new Nwh\About();


    $helloInstance->sayHello();

    //$jasonStore = new Nws\DAO\JsonData("productos.json");

    $sessionStore = new Nws\DAO\SessionData("productos");

    $productos = new Nws\DAO\Productos($jasonStore);

    $productoA = new \Nws\Productos\DTO\Producto();
    $productoA->SKU = "001";
    $productoA->Descripcion = "Primer producto";
    $productoA->Precio = 1000.34;

    $productos ->addProducto($productoA);
    print_r($productos->getProductos());
