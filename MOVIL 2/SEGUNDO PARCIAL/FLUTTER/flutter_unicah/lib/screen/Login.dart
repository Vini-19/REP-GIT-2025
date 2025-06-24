//importar la libreria material

import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 78, 95, 248),
        title: Text("LOGIN"),
      ),
      body: cuerpo(),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////

Widget cuerpo() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          "https://cdn.pixabay.com/photo/2025/05/18/14/05/congratulations-9607355_1280.png",
        ),
      ),
    ),
    child: Center(
      child: Column(children: [nombre(), usuario(), password(), btn_usuario()]),
    ),
  );
}
///////////////////////////////////////////////////////////////////////////////////

Widget nombre() {
  return const Text(
    "USUARIO:",
    style: TextStyle(
      color: Color.fromARGB(255, 255, 1, 1),
      fontSize: 30.0,
      fontWeight: FontWeight.w200,
    ),
  );
}

//////////////////////////////////////////////////////////////////////////////

Widget usuario() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Ingrese su usuario:",
        fillColor: Color.fromARGB(255, 255, 255, 255),
        filled: true,
      ),
    ),
  );
}
/////////////////////////////////////////////////////////////////////////////////////

Widget password() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Ingrese su password:",
        fillColor: Color.fromARGB(255, 255, 255, 255),
        filled: true,
      ),
    ),
  );
}

//////////////////////////////////////////////////////////////////////////////////////

Widget btn_usuario() {
  return ElevatedButton(onPressed: () {}, child: Text("INGRESAR"));
}

//////////////////////////////////////////////////////////////////////////////////////////
