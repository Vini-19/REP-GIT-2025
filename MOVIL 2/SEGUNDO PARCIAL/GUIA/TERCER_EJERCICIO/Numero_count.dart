import 'dart:io';

void main() {
  List<int> nums = [];

  for (var i = 1; i <= 3; i++) {
    stdout.write("Número $i: ");
    int? n = int.tryParse(stdin.readLineSync() ?? '');
    if (n == null) {
      print("Entrada inválida, intenta otra vez.");
      i--;
      continue;
    }
    nums.add(n);
  }

  print("El número más pequeño es: ${nums.reduce((a, b) => a < b ? a : b)}");
}
 