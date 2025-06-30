import 'dart:io';
import 'class/deposito.dart';
import 'class/retiro.dart';
import 'class/saldo.dart';

void main() {
  var cuenta = Saldo();
  var dep = Deposito();
  var ret = Retiro();

  var salir = false;

  while (!salir) {
    print('\n=== CAJERO AUTOMÁTICO UNICAH ===');
    print('1) Depositar');
    print('2) Retirar');
    print('3) Consultar saldo');
    print('4) Salir');
    stdout.write('Opción: ');

    var opcion = stdin.readLineSync();

    if (opcion == '1') {
      stdout.write('Cantidad a depositar: ');
      var entrada = stdin.readLineSync();
      var cantidad = double.tryParse(entrada ?? '');
      if (cantidad != null) {
        dep.realizarDeposito(cantidad, cuenta);
      } else {
        print('Valor no válido.');
      }
      esperarParaContinuar();
    } else if (opcion == '2') {
      stdout.write('Cantidad a retirar: ');
      var entrada = stdin.readLineSync();
      var cantidad = double.tryParse(entrada ?? '');
      if (cantidad != null) {
        ret.realizarRetiro(cantidad, cuenta);
      } else {
        print('Valor no válido.');
      }
      esperarParaContinuar();
    } else if (opcion == '3') {
      cuenta.mostrarSaldo();
      esperarParaContinuar();
    } else if (opcion == '4') {
      print('Sesión finalizada. ¡Gracias por usar el sistema!');
      salir = true;
    } else {
      print('Opción incorrecta.');
      esperarParaContinuar();
    }
  }
}

void esperarParaContinuar() {
  print('\nPresiona ENTER para volver al menú...');
  stdin.readLineSync();
}
