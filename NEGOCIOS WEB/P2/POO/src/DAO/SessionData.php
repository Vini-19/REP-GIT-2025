<?php

namespace Nws\DAO;
use Exception;

class SessionData implements IData{
    private string $dataKey;
    private array $data;

    public function __construct(string $dataKey){
         if(!isset($_SESSION)){
            throw new Exception("debe iniciar session con session_start");
        }
        $this->dataKey = $dataKey;
    }
    

    public function Guardar(array $data){
        $_SESSION[$this->dataKey] = $data;
    }

    public function Obtener(): array{
        if(isset($_SESSION[$this->dataKey])){
            $data = $_SESSION[$this->dataKey];
        }
    }
}