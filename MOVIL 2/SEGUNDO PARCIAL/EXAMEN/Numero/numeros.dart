import 'dart:io';

void main() {
  List<int> numeros = [];
  int contador = 0;

  print('Ingrese 10 numero enteros que esten entre 100 y 500:');
  while (numeros.length < 10) {
    stdout.write('Numero${contador + 1}:');
    String? entrada = stdin.readLineSync();

    if (entrada == null) {
      print('Entrada inválida. Intente de nuevo.');
      continue;
    }
    int? numero = int.tryParse(entrada);
    if (numero == null) {
      print('Debe ingresar un número entero válido.');
      continue;
    }
    if (numero < 100 || numero > 500) {
      print(
        'El número ingresado está fuera del rango (100 - 500).Ingresa uno de esos rangos.',
      );
    } else {
      numeros.add(numero);
      contador++;
    }
  }

  print('\nLos 10 numeros que se ingresaron son estos:');
  for (int i = 0; i < numeros.length; i++) {
    print('${i + 1}.${numeros[i]}');
  }
}
