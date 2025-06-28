<?php   
namespace Nws\Productos\Decoradores;



class ExtraIngrediente extends ADecorador{
    public function __construct(string $ingrediente, string $valor){
        parent::__construct($valor,"Extra". $ingrediente, EtipoOperacion::SumaValor);
    }
}