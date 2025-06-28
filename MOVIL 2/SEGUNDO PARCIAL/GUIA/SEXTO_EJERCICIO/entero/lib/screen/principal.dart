import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final TextEditingController _controller = TextEditingController();
  final List<int> _numeros = [];

  void _agregarNumero() {
    final int? numero = int.tryParse(_controller.text);

    if (numero == null) {
      _mostrarMensaje('Ingrese un número válido');
    } else if (numero < 0) {
      _mostrarMensaje('No se permiten números negativos');
    } else {
      setState(() {
        _numeros.add(numero);
        _controller.clear();
      });

      if (_numeros.length == 10) {
        _mostrarResultados();
      }
    }
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  void _mostrarResultados() {
    final int mayor = _numeros.reduce((a, b) => a > b ? a : b);
    final int menor = _numeros.reduce((a, b) => a < b ? a : b);
    final int suma = _numeros.reduce((a, b) => a + b);
    final double media = suma / _numeros.length;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Resultados'),
        content: Text(
          'Mayor número: $mayor\n'
          'Menor número: $menor\n'
          'Suma: $suma\n'
          'Media: ${media.toStringAsFixed(2)}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _numeros.clear(); // reiniciar para nueva entrada
              });
              Navigator.of(context).pop();
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresar 10 Números'),
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
                labelText: 'Ingrese un número entero',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _agregarNumero,
              child: const Text('Agregar Número'),
            ),
            const SizedBox(height: 20),
            Text('Números ingresados: ${_numeros.length}/10'),
          ],
        ),
      ),
    );
  }
}
