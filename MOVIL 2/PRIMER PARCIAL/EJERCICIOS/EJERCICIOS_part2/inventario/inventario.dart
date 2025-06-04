import 'dart:io';
import 'dart:convert';

class Producto {
  String nombre;
  int stock;
  double precio;

  Producto({required this.nombre, required this.stock, required this.precio});

  Map<String, dynamic> toJson() => {
    'nombre': nombre,
    'stock': stock,
    'precio': precio,
  };

  static Producto fromJson(Map<String, dynamic> json) {
    return Producto(
      nombre: json['nombre'],
      stock: json['stock'],
      precio: (json['precio'] as num).toDouble(),
    );
  }

  void mostrarDatos() {
    print('Nombre: $nombre');
    print('Stock: $stock unidades');
    print('Precio: \$${precio.toStringAsFixed(2)}');
    print('---');
  }
}

const String archivoInventario = 'inventario.txt';

Future<void> main() async {
  List<Producto> inventario = await cargarInventario();

  while (true) {
    print('\n--- MENÚ PRINCIPAL ---');
    print('1. Registrar un nuevo producto');
    print('2. Mostrar el inventario');
    print('3. Salir');
    stdout.write('Seleccione una opción: ');
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        await registrarProducto(inventario);
        break;
      case '2':
        mostrarInventario(inventario);
        break;
      case '3':
        print('Programa finalizado.');
        return;
      default:
        print('Opción no válida. Intente de nuevo.');
    }
  }
}

Future<void> registrarProducto(List<Producto> inventario) async {
  stdout.write('Nombre del producto: ');
  String? nombre = stdin.readLineSync();

  stdout.write('Cantidad en stock: ');
  int? stock = int.tryParse(stdin.readLineSync() ?? '');

  stdout.write('Precio del producto: ');
  double? precio = double.tryParse(stdin.readLineSync() ?? '');

  if (nombre == null || stock == null || precio == null) {
    print('Datos inválidos. Intente de nuevo.');
    return;
  }

  Producto producto = Producto(nombre: nombre, stock: stock, precio: precio);
  inventario.add(producto);
  await guardarInventario(inventario);
  print('Producto registrado y guardado con éxito.');
}

void mostrarInventario(List<Producto> inventario) {
  if (inventario.isEmpty) {
    print('No hay productos registrados.');
  } else {
    print('\n--- INVENTARIO ACTUAL ---');
    for (var producto in inventario) {
      producto.mostrarDatos();
    }
  }

  print('Presione Enter para volver al menú...');
  stdin.readLineSync();
}

Future<void> guardarInventario(List<Producto> inventario) async {
  List<Map<String, dynamic>> jsonList =
      inventario.map((p) => p.toJson()).toList();

  String jsonString = JsonEncoder.withIndent('  ').convert(jsonList);

  File archivo = File(archivoInventario);
  await archivo.writeAsString(jsonString);

  print('Datos guardados en: ${archivo.absolute.path}');
}

Future<List<Producto>> cargarInventario() async {
  File archivo = File(archivoInventario);
  if (!await archivo.exists()) {
    return [];
  }

  String contenido = await archivo.readAsString();
  if (contenido.trim().isEmpty) return [];

  List<dynamic> jsonList = jsonDecode(contenido);
  return jsonList.map((e) => Producto.fromJson(e)).toList();
}
