import 'dart:io';

void main() {
  List<int> listaNumeros = [];
  int indiceActual = 1;

  print('Debes ingresar 10 números enteros entre 100 y 500.');

  while (listaNumeros.length < 10) {
    stdout.write('Ingrese el número $indiceActual: ');
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print('No se recibió ningún valor. Intente nuevamente.');
      continue;
    }

    int? valor = int.tryParse(input);
    if (valor == null) {
      print('Lo ingresado no es un número válido.');
      continue;
    }

    if (valor < 100 || valor > 500) {
      print('El número debe estar en el rango de 100 a 500.');
    } else {
      listaNumeros.add(valor);
      indiceActual++;
    }
  }

  print('\nResumen de los números ingresados:');
  for (var i = 0; i < listaNumeros.length; i++) {
    print('${i + 1}. ${listaNumeros[i]}');
  }
}
