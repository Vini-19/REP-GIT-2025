import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final TextEditingController _costoController = TextEditingController();

  void _calcularDescuento() {
    final double? costo = double.tryParse(_costoController.text);

    if (costo == null || costo < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingrese un costo válido y positivo')),
      );
      return;
    }

    final double descuento = costo * 0.10;
    final double total = costo - descuento;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Descuento: L\$${descuento.toStringAsFixed(2)}\n'
          'Total a pagar: L\$${total.toStringAsFixed(2)}',
        ),
      ),
    );

    _costoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descuento en Farmacia'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _costoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Costo de los medicamentos',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularDescuento,
              child: const Text('Calcular Descuento'),
            ),
          ],
        ),
      ),
    );
  }
}
