import 'package:flutter/material.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 78, 98, 248),
        title: Text("PROGRAMACION MOVIL 2"),
      ),
      body: Text("UNICAH 2025"),
    );
  }
}
