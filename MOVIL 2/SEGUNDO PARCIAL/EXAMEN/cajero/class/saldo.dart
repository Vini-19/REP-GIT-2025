class Saldo {
  double _saldo = 0;

  double obtenerSaldo() => _saldo;

  void aumentarSaldo(double cantidad) {
    _saldo += cantidad;
  }

  void disminuirSaldo(double cantidad) {
    _saldo -= cantidad;
  }

  void vaciarSaldo() {
    _saldo = 0;
  }

  void mostrarSaldo() {
    print('Saldo actual: L. ${_saldo.toStringAsFixed(2)}');
  }
}
