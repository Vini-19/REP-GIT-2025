import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final TextEditingController _controller = TextEditingController();

  void _convertir() {
    final double? celsius = double.tryParse(_controller.text);

    if (celsius == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingrese un valor válido en grados centígrados'),
        ),
      );
      return;
    }

    final double fahrenheit = 32 + (9 * celsius / 5);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$celsius°C equivalen a ${fahrenheit.toStringAsFixed(2)}°F',
        ),
      ),
    );

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convertir a Fahrenheit'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Grados Centígrados',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertir,
              child: const Text('Convertir'),
            ),
          ],
        ),
      ),
    );
  }
}
