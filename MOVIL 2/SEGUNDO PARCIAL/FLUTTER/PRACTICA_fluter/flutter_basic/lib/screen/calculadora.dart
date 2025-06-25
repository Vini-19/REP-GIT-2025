import 'package:flutter/material.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final n1 = TextEditingController();
    final n2 = TextEditingController();

    void mostrarResultado(
      BuildContext context,
      String operacion,
      double resultado,
    ) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(operacion),
            content: Text("Resultado: $resultado"),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 56, 78, 248),
        title: const Text("CALCULADORA MATEMATICA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: n1, keyboardType: TextInputType.number),
            TextField(controller: n2, keyboardType: TextInputType.number),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: "btn1",
                  onPressed: () {
                    double resultado =
                        double.parse(n1.text) + double.parse(n2.text);
                    mostrarResultado(context, "Suma", resultado);
                  },
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () {
                    double resultado =
                        double.parse(n1.text) - double.parse(n2.text);
                    mostrarResultado(context, "Resta", resultado);
                  },
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: "btn3",
                  onPressed: () {
                    double resultado =
                        double.parse(n1.text) * double.parse(n2.text);
                    mostrarResultado(context, "Multiplicación", resultado);
                  },
                  child: Icon(Icons.clear),
                ),
                FloatingActionButton(
                  heroTag: "btn4",
                  onPressed: () {
                    double resultado =
                        double.parse(n1.text) / double.parse(n2.text);
                    mostrarResultado(context, "División", resultado);
                  },
                  child: Icon(Icons.horizontal_rule),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
