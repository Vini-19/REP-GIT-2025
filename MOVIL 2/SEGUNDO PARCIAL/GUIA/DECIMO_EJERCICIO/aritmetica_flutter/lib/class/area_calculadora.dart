import 'dart:math';

class AreaCalculator {
  double areaCuadrado(double lado) {
    return lado * lado;
  }

  double areaCirculo(double radio) {
    return pi * pow(radio, 2);
  }

  double areaTriangulo(double base, double altura) {
    return (base * altura) / 2;
  }
}
