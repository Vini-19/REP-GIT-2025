import 'saldo.dart';

class Retiro {
  void realizarRetiro(double monto, Saldo cuenta) {
    if (monto <= 0) {
      print('Monto inválido.');
      return;
    }

    if (monto >= cuenta.obtenerSaldo()) {
      print('No hay suficiente. Se retira todo.');
      cuenta.vaciarSaldo();
    } else {
      cuenta.disminuirSaldo(monto);
      print('Retiro de L. ${monto.toStringAsFixed(2)} realizado.');
    }
  }
}
