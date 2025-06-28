import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _num3Controller = TextEditingController();

  void _mostrarMayor() {
    final int? num1 = int.tryParse(_num1Controller.text);
    final int? num2 = int.tryParse(_num2Controller.text);
    final int? num3 = int.tryParse(_num3Controller.text);

    if (num1 == null || num2 == null || num3 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingrese solo números enteros válidos')),
      );
      return;
    }

    int mayor = num1;
    if (num2 > mayor) mayor = num2;
    if (num3 > mayor) mayor = num3;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('El mayor número es: $mayor')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Número Mayor'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 1'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 2'),
            ),
            TextField(
              controller: _num3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 3'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _mostrarMayor,
              child: const Text('Mostrar el mayor'),
            ),
          ],
        ),
      ),
    );
  }
}
