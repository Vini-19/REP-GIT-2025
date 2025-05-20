void main() {
  int entero = 2025;
  print(entero);

  String nombre = "Vinicio";
  print(nombre);

  dynamic dato = 20;
  print(dato);

  double decimal = 20.5;
  print(decimal);

  bool valor = true;
  print(valor);

  //saidas

  print("\n Nombre es: " + "$nombre" + "\n Numero Decimal es: " + "$decimal");

  //operaciones aritmeticas

  int x = 25;
  int y = 20;

  dynamic resultado = x + y;
  print("su suma es: $resultado");
  //resta

  dynamic resoltadoResta = x - y;
  print("su resta es: $resoltadoResta");

  dynamic resultadoMultiplicacion = x * y;
  print("su multiplicacion es: $resultadoMultiplicacion");
  //division
  dynamic resultadoDivision = x / y;
  print("su division es: $resultadoDivision");

  // Operadores condicionales
  /*
> mayor que
< menor que
== igual
<= menor igual
>= igual
is = compara el valor de los datos
is! = compara si el valor de los datos son distintos
!= si son diferentes
*/

  /// igualdad

  var re = 30 == 15;
  print(re);
  /*> mayor que*/
  var rema = 30 > 15;
  print(rema);

  /*< menor que*/
  var remeno = 30 < 15;
  print(remeno);

  /*== igual*/
  var reigual = 30 == 15;
  print(reigual);

  /*<= menor igual*/
  var remenoigual = 30 <= 15;
  print(remenoigual);

  /*>= igual*/
  var reigualma = 30 >= 15;
  print(reigualma);

  /* is = compara el valor de los datos*/
  var reisigua = 30 is int; // ¿30 es un int?
  print(reisigua); // true

  /* is! = compara si el valor de los datos son distintos*/

  var reiss = 30 is! String; // ¿30 NO es un String?
  print(reiss); // true

  /* != si son diferentes*/
  var reiis = 30 != 15;
  print(reiis);
}
