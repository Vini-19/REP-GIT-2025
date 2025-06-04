import 'dart:io';
import 'dart:convert';

class Estudiante {
  String nombre;
  int edad;
  List<double> notas;
  double promedio;

  Estudiante({required this.nombre, required this.edad, required this.notas})
    : promedio =
          notas.isNotEmpty ? notas.reduce((a, b) => a + b) / notas.length : 0.0;

  Map<String, dynamic> toJson() => {
    'nombre': nombre,
    'edad': edad,
    'notas': notas,
  };

  static Estudiante fromJson(Map<String, dynamic> json) {
    List<dynamic> notasJson = json['notas'];
    List<double> notas = notasJson.map((n) => (n as num).toDouble()).toList();
    return Estudiante(nombre: json['nombre'], edad: json['edad'], notas: notas);
  }

  void mostrarDatos() {
    print('Nombre: $nombre');
    print('Edad: $edad');
    print('Notas: ${notas.join(', ')}');
    print('Promedio: ${promedio.toStringAsFixed(2)}');
    print('---');
  }
}

const String archivoEstudiantes = 'estudiantes.txt';

void main() async {
  List<Estudiante> estudiantes = await cargarEstudiantes();

  while (true) {
    print('\n--- MENÚ PRINCIPAL ---');
    print('1. Registrar un nuevo estudiante');
    print('2. Mostrar la lista de estudiantes registrados');
    print('3. Salir');
    stdout.write('Seleccione una opción: ');
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        await registrarEstudiante(estudiantes);
        break;
      case '2':
        mostrarEstudiantes(estudiantes);
        break;
      case '3':
        print('Programa finalizado.');
        return;
      default:
        print('Opción no válida. Intente de nuevo.');
    }
  }
}

Future<void> registrarEstudiante(List<Estudiante> estudiantes) async {
  stdout.write('Nombre del estudiante: ');
  String? nombre = stdin.readLineSync();

  stdout.write('Edad del estudiante: ');
  int? edad = int.tryParse(stdin.readLineSync() ?? '');

  if (nombre == null || edad == null) {
    print('Datos inválidos. Intente de nuevo.');
    return;
  }

  List<double> notas = [];
  for (int i = 1; i <= 3; i++) {
    stdout.write('Nota $i (0 a 10): ');
    double? nota = double.tryParse(stdin.readLineSync() ?? '');
    if (nota == null || nota < 0 || nota > 10) {
      print('Nota inválida. Intente de nuevo.');
      i--;
    } else {
      notas.add(nota);
    }
  }

  Estudiante estudiante = Estudiante(nombre: nombre, edad: edad, notas: notas);
  estudiantes.add(estudiante);
  await guardarEstudiantes(estudiantes);
  print('Estudiante registrado y guardado con éxito.');
}

void mostrarEstudiantes(List<Estudiante> estudiantes) {
  if (estudiantes.isEmpty) {
    print('No hay estudiantes registrados.');
  } else {
    print('\n--- LISTA DE ESTUDIANTES ---');
    for (var estudiante in estudiantes) {
      estudiante.mostrarDatos();
    }
  }

  print('Presione Enter para volver al menú...');
  stdin.readLineSync(); // Espera que el usuario presione Enter
}

Future<void> guardarEstudiantes(List<Estudiante> estudiantes) async {
  List<Map<String, dynamic>> jsonList =
      estudiantes.map((e) => e.toJson()).toList();

  // Guardar con formato legible (indentado)
  String jsonString = JsonEncoder.withIndent('  ').convert(jsonList);

  File archivo = File(archivoEstudiantes);
  await archivo.writeAsString(jsonString);

  print('Datos guardados en: ${archivo.absolute.path}');
}

Future<List<Estudiante>> cargarEstudiantes() async {
  File archivo = File(archivoEstudiantes);
  if (!await archivo.exists()) {
    return [];
  }

  String contenido = await archivo.readAsString();
  if (contenido.trim().isEmpty) return [];

  List<dynamic> jsonList = jsonDecode(contenido);
  return jsonList.map((e) => Estudiante.fromJson(e)).toList();
}
