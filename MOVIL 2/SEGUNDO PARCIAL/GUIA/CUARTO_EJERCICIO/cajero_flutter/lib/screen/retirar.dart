import 'package:flutter/material.dart';

class Retirar extends StatefulWidget {
  const Retirar({Key? key}) : super(key: key);

  @override
  _RetirarState createState() => _RetirarState();
}

class _RetirarState extends State<Retirar> {
  double saldo = 1000.0; // Puedes cambiar este valor inicial según lo necesites
  final TextEditingController _controller = TextEditingController();

  void _realizarRetiro() {
    final monto = double.tryParse(_controller.text);
    if (monto == null || monto <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Ingrese un monto válido')));
    } else if (monto > saldo) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Saldo insuficiente')));
    } else {
      setState(() {
        saldo -= monto;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Retiro de L\$${monto.toStringAsFixed(2)} realizado'),
        ),
      );
      _controller.clear();
    }
  }

  void _consultarSaldo() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Saldo actual: L\$${saldo.toStringAsFixed(2)}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retirar Dinero'),
        backgroundColor: const Color.fromARGB(255, 218, 2, 60),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese monto a retirar',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _realizarRetiro,
              child: const Text('Retirar'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _consultarSaldo,
              child: const Text('Consultar Saldo'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
