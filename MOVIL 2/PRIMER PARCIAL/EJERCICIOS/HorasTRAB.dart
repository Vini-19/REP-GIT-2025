import 'dart:io';

void main() {
  const int horasPorDia = 10;
  const int horasExtras = 15;
  const int sueldo = 0;
  const int extras = 0;

  print("ingresse sus horas trabajadas");
  int horas = int.parse(stdin.readLineSync()!);
  if (horas <= 40) {
    int sueldo = horas * horasPorDia;
    print("sus horas trabajadas son: $horas");
    print("su sueldo es: $sueldo");
  } else if (horas > 40) {
    int sueldo = horas * horasPorDia;
    int extras = (horas - 40) * horasExtras;
    print("sus horas trabajadas son: $horas");
    print("su sueldo de horas extras son: $extras");
    print("su sueldo es: ${sueldo + extras}");
  }
}
