import 'dart:io';

void main() {
  stdout.write("Ingresa una oración: ");
  String? oracion = stdin.readLineSync();

  if (oracion?.trim().isEmpty ?? true) {
    print("Entrada no válida.");
    return;
  }

  int cantidad = oracion!.trim().split(RegExp(r'\s+')).length;
  print("La oración tiene $cantidad palabra(s).");
}
