import 'dart:io';
import 'dart:convert';

class Persona {
  String nombre;
  int edad;

  Persona({required this.nombre, required this.edad});

  Map<String, dynamic> toJson() => {'nombre': nombre, 'edad': edad};

  static Persona fromJson(Map<String, dynamic> json) {
    return Persona(nombre: json['nombre'], edad: json['edad']);
  }

  void mostrarDatos() {
    print('Nombre: $nombre');
    print('Edad: $edad años');
    print('---');
  }
}

const String archivoPersonas = 'personas.txt';

void main() async {
  List<Persona> lista = await cargarPersonas();

  while (true) {
    print('\n--- MENÚ PRINCIPAL ---');
    print('1. Registrar una nueva persona');
    print('2. Mostrar personas registradas');
    print('3. Salir');
    stdout.write('Seleccione una opción: ');
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        await registrarPersona(lista);
        break;
      case '2':
        mostrarPersonas(lista);
        break;
      case '3':
        print('Programa finalizado.');
        return;
      default:
        print('Opción no válida. Intente de nuevo.');
    }
  }
}

Future<void> registrarPersona(List<Persona> lista) async {
  stdout.write('Nombre: ');
  String? nombre = stdin.readLineSync();

  stdout.write('Edad: ');
  int? edad = int.tryParse(stdin.readLineSync() ?? '');

  if (nombre == null || edad == null) {
    print('Datos inválidos. Intente de nuevo.');
    return;
  }

  Persona persona = Persona(nombre: nombre, edad: edad);
  lista.add(persona);
  await guardarPersonas(lista);
  print('Persona registrada con éxito.');
}

void mostrarPersonas(List<Persona> lista) {
  if (lista.isEmpty) {
    print('No hay personas registradas.');
  } else {
    print('\n--- LISTA DE PERSONAS ---');
    for (var persona in lista) {
      persona.mostrarDatos();
    }
  }

  print('Presione Enter para volver al menú...');
  stdin.readLineSync();
}

Future<void> guardarPersonas(List<Persona> lista) async {
  List<Map<String, dynamic>> jsonList = lista.map((p) => p.toJson()).toList();

  String jsonString = JsonEncoder.withIndent('  ').convert(jsonList);

  File archivo = File(archivoPersonas);
  await archivo.writeAsString(jsonString);

  print('Datos guardados en: ${archivo.absolute.path}');
}

Future<List<Persona>> cargarPersonas() async {
  File archivo = File(archivoPersonas);
  if (!await archivo.exists()) {
    return [];
  }

  String contenido = await archivo.readAsString();
  if (contenido.trim().isEmpty) return [];

  List<dynamic> jsonList = jsonDecode(contenido);
  return jsonList.map((e) => Persona.fromJson(e)).toList();
}
