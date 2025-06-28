import 'package:flutter/material.dart';

class Depositar extends StatefulWidget {
  const Depositar({Key? key}) : super(key: key);

  @override
  _DepositarState createState() => _DepositarState();
}

class _DepositarState extends State<Depositar> {
  double saldo = 0.0;
  final TextEditingController _controller = TextEditingController();

  void _realizarDeposito() {
    final monto = double.tryParse(_controller.text);
    if (monto != null && monto > 0) {
      setState(() {
        saldo += monto;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Depósito de L\$${monto.toStringAsFixed(2)} realizado'),
        ),
      );
      _controller.clear();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Ingrese un monto válido')));
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
        title: const Text('Depositar'),
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
                labelText: 'Ingrese monto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _realizarDeposito,
              child: const Text('Depositar'),
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
