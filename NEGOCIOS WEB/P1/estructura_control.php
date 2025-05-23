<?php
    $txtNombre = "";
    $txtResultado = "";
    if (isset($_POST["btnEnviar"])) {
        $txtNombre = $_POST["txtNombre"];
        $txtResultado = "Bienvenido " . $txtNombre;
        //TODO VALOR QUE VIENE DE UN FORMULARIO HTML >> ES TEXTO!!
    }/*elsif(){
        
    }else{

    }*/
    switch($txtCaso){
        case "PRC":
            error_log("Entro con valor". $txtCaso);
            //expresiones
            break;
        case "DEL":
            break;
        case "UPD":
            break;
        case "INS":
            break;
        default;
    }
    //condiciones ternarias
    $isOfAge = false;
    $hasAccess = ($isOfAge)? true : false

    //convertir string a numero o int
    $txtNumeroOperador1 ="100";
    //estos  son  operadores para convertir numeros enteros o flotante
    $intNumero = intval($txtNumeroOperador1);
    $fltNumber  = floatval($txtNumeroOperador1);

    for($i = 0; $i<100; $i ++){

    }

    $i = 0;
    while($i<100){
        $i ++;

    }

    $j = 0;
    do{
        //expresiones
    }while($j <0);
    

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>REgistro de Nombre</h1>
    <form action="estructuras_control.php" method="post">
    <div>
        <label for="txtNombre">Nombre:</label>
        <input 
            id="txtNombre"
            name="txtNombre"
            placeholder="eg . John Doe"
            type="text"/>
    </div>
    <button type="submit" name="btnEnviar">Enviar</button>
    </form>

    <!-- En este caso al hacer una condicional se ingresa primero el php se puede abrir la llave pero se tiene que serrar
     pero tambien seguir con el html -->
    <?php if($txtResultado !=="") {?>
    <section>
        <?php echo $txtResultado; ?>
    </section>
    <?php }?>
    
</body>
</html>