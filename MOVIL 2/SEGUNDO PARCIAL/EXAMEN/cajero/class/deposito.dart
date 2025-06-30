import 'saldo.dart';

class Deposito {
  void realizarDeposito(double monto, Saldo cuenta) {
    if (monto <= 0) {
      print('El monto debe ser positivo.');
      return;
    }

    cuenta.aumentarSaldo(monto);
    print('Se ha depositado L. ${monto.toStringAsFixed(2)} correctamente.');
  }
}
