import 'package:flutter/material.dart';
import '../class/area_calculadora.dart';

class Principal extends StatefulWidget {
  const Principal({super.key}); // Ahora es const

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final _input1Controller = TextEditingController();
  final _input2Controller = TextEditingController();

  int _opcion = 0;
  double _resultado = 0.0;

  void _calcular() {
    final calc = AreaCalculator();

    switch (_opcion) {
      case 1:
        double lado = double.tryParse(_input1Controller.text) ?? 0;
        _resultado = calc.areaCuadrado(lado);
        break;
      case 2:
        double radio = double.tryParse(_input1Controller.text) ?? 0;
        _resultado = calc.areaCirculo(radio);
        break;
      case 3:
        double base = double.tryParse(_input1Controller.text) ?? 0;
        double altura = double.tryParse(_input2Controller.text) ?? 0;
        _resultado = calc.areaTriangulo(base, altura);
        break;
      default:
        _resultado = 0.0;
    }

    setState(() {});
  }

  Widget _entradas() {
    if (_opcion == 3) {
      return Column(
        children: [
          TextField(
            controller: _input1Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Base'),
          ),
          TextField(
            controller: _input2Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Altura'),
          ),
        ],
      );
    } else if (_opcion != 0) {
      return TextField(
        controller: _input1Controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: _opcion == 1 ? 'Lado' : 'Radio'),
      );
    }
    return Container();
  }

  void _seleccionar(int opcion) {
    setState(() {
      _opcion = opcion;
      _input1Controller.clear();
      _input2Controller.clear();
      _resultado = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Áreas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<int>(
              value: _opcion == 0 ? null : _opcion,
              hint: const Text('Selecciona una figura'),
              items: const [
                DropdownMenuItem(value: 1, child: Text('Cuadrado')),
                DropdownMenuItem(value: 2, child: Text('Círculo')),
                DropdownMenuItem(value: 3, child: Text('Triángulo')),
              ],
              onChanged: (value) {
                if (value != null) _seleccionar(value);
              },
            ),
            const SizedBox(height: 10),
            _entradas(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _opcion != 0 ? _calcular : null,
              child: const Text('Calcular Área'),
            ),
            const SizedBox(height: 20),
            Text(
              _resultado > 0 ? 'Área: $_resultado' : '',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
