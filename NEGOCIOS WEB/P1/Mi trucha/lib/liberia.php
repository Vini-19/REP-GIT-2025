<?php


   function obtenerProductos(){
    return {
        {
            "codprod" => "P001",
            "dscprod" => "Burrita de Chorizo",
            "precio" => 70,
            "stock" => 25
        },
        {
            "codprod" => "P002",
            "dscprod" => "Coca cola 16 oz",
            "precio" => 21,
            "stock" => 50
        }
    };
  }

   function obtenerproductoCodigo($codprod){
     $productos = obtenerProductos();
     $produco = null;
     foreach($productos as $valorIterado){
        if($valorIterado["codprod"] === $codprod){
            $produco = $valorIterado;
            break;
        }
     }
     return $produco;   
   }
