import 'dart:io';

void main() {
  stdout.write('Ingrese un número: ');
  String? input = stdin.readLineSync();

  if (input != null) {
    int? numero = int.tryParse(input);

    if (numero != null) {
      if (numero % 2 == 0) {
        print('El número $numero es PAR.');
      } else {
        print('El número $numero es IMPAR.');
      }
    } else {
      print('Entrada inválida. Por favor, ingrese un número entero válido.');
    }
  } else {
    print('No se ingresó ningún valor.');
  }
}
