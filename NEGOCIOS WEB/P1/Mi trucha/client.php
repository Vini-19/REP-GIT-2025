<?php 


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
            <tr>
                <td>Cod</td>
                <td>Product</td>
                <td>Precio</td>
                <td>&nbsp;</td>
                <td></td>
            </tr>
            <tbody>
                <td></td>
                <td></td>
                <td>
                    <form action="client.php" method="post">
                        <input type="hidden" value="codigo_producto" name="codprod">
                        <button type="submit" name="btnAddProducto">+</button>
                    </form>
                </td>
            </tbody>
        </table>
        </div>
        <div class="orden"></div>
      </section>
    <main>
    <footer>

    </footer>
</body>
</html>