<?php 

    require_once 'lib/liberia.php';
    $catalogo = obtenerProductos();
    /*
    include
    include_once
    requiere
    requiere_once*/

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>La truca</title>
</head>
<body>
    <header>
        <div><h1>La trucha New order</h1></div>
        <nav>
            <ul>
                <li>
                    <a href="truchero.php">truchero</a>
                </li>
            </ul>
        </nav>
     <header>
    <main>
      <section>
        <div class="productos">
                <table>
                    <thead>
                        <tr>
                            <th>Cod</th>
                            <th>Producto</th>
                            <th>Precio</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($catalogo as $producto) { ?>
                            <tr>
                                <td><?php echo $producto["codprod"]; ?></td>
                                <td><?php echo $producto["dscprod"]; ?></td>
                                <td><?php echo $producto["precio"]; ?></td>
                                <td>
                                    <form action="client.php" method="post">
                                        <input type="hidden" value="<?php echo $producto["codprod"]; ?>" name="codprod" />
                                        <button type="submit" name="btnAddProduct">+</button>
                                    </form>
                                </td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        <div class="orden">
            <table>
                <thead>
                    <tr>
                        <td>codigo</td>
                        <td>producto</td>
                        <td>cantidad</td>
                        <td>&nbsp;</td>
                        <td>subtotal</td>
                    </tr>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <form action="client.php" method="post">
                                    <input type="hidden" value="codigo_producto" name="codprod">
                                    <button type="submit" name="btnAddProduct">+</button>
                                    &nbsp;
                                    <button type="submit" name="btnRemoveProduct">-</button>
                                </form>
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </thead>
                <tfoot>
                    <tr>
                        <td colspan="4">Total:</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <form action="client.php" method="post">
                                    <input type="hidden"name="orderID" value="order_id" />
                                    <button type="submit" name="btnEnviar">
                                        Enviar
                                    </button>
                                    <button type="submit" name="btnCancelar">
                                        Cancelar
                                    </button>
                            </form>
                            
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
      </section>
    <main>
    <footer>

    </footer>
</body>
</html>