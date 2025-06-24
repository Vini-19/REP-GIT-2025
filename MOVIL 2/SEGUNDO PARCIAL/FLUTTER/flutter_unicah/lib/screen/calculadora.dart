// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: camel_case_types
class calculadora extends StatelessWidget {
  const calculadora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
//variables de numero 1, numero2
    final n1 = TextEditingController();
    final n2 = TextEditingController();
    double suma = 0;

    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Color.fromARGB(255, 56, 78, 248),
        title: const Text("CALCULADORA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: n1,
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: n2,
              keyboardType: TextInputType.number,
            ),
            FloatingActionButton(
                onPressed: () {
                  suma = double.parse(n1.text) + double.parse(n2.text);
                  showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: Text("Suma"),
                        content: Text("resultado: $suma"),
                      );
                    }),
                  );
                },
                child: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
