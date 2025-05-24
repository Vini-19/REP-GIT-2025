<?php
$txtNombre = "";
$txtApellidos = "";
$Edad = "";
$txtResultado = "";

if (isset($_POST["btnEnviar"])) {

    $txtNombre = $_POST["txtNombre"];
    $txtApellidos =$_POST["txtApellidos"];
    $Edad =$_POST["Edad"];

    $txtResultado = "Bienvenido " . $txtNombre ." ".  $txtApellidos ." "."con edad de ". $Edad . " Años";
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <h1>Registro De Nombre y Edad</h1>
    <form action="Registro.php" method="post">
        <div>
            <label for="txtNombre">Nombres: </label>
            <input
                name="txtNombre"
                id="txtNombre"
                placeholder="Vinicio ">

        </div>
        <div>
            <label for="txtApellidos">Apellidos:</label>
            <input
                name="txtApellidos"
                id="txtApellidos"
                placeholder="Sanchez Amaya">
        </div>
        <div>
            <label for="Edad">Edad:</label>
            <input 
            name="Edad"
            id="Edad"
            placeholder="21">
        </div>

        <button type="submit" name="btnEnviar">ENVIAR</button>
    </form>

    <?php if ($txtResultado !== "") { ?>
        <section>
            <?php echo $txtResultado; ?>
        </section>
    <?php } ?>

</body>

</html>