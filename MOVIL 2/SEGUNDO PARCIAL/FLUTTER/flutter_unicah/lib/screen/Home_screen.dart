//importar la libreria material

import 'package:flutter/material.dart';

class home_screen extends StatelessWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 78, 95, 248),
        title: Text("PROGRAMACION MOVIL II"),
      ),
      body: const Text("UNICAH 2025"),
    );
  }
}
