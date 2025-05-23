import 'dart:io';

void main() {
  const double euro = 29.33;
  const double dolar = 26.09;

  print('Elige la opción de conversión:');
  print('1. Dólar');
  print('2. Euro');
  stdout.write('Opción: ');
  String? opcion = stdin.readLineSync();

  switch (opcion) {
    case '1':
      stdout.write('Ingrese la cantidad en lempiras para convertir a dólar: ');
      String? valor = stdin.readLineSync();
      double cantMoneda = double.parse(valor!);
      double resultado = cantMoneda / dolar;
      print(
        '$cantMoneda lempiras son equivalentes a ${resultado.toStringAsFixed(2)} dólares.',
      );
      break;
    case '2':
      stdout.write('Ingrese la cantidad en lempiras para convertir a euro: ');
      String? valor = stdin.readLineSync();
      double cantMoneda = double.parse(valor!);
      double resultado = cantMoneda / euro;
      print(
        '$cantMoneda lempiras son equivalentes a ${resultado.toStringAsFixed(2)} euros.',
      );
      break;
    default:
      print('Opción no válida.');
  }
}
