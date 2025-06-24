import 'Login.dart';
import 'Home_screen.dart';
import 'calculadora.dart';
import 'galeria.dart';
import 'package:flutter/material.dart';

class menu extends StatelessWidget {
  const menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 2, 60),
        title: Text("MENU"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fondo desde internet
          Image.network(
            'https://images.unsplash.com/photo-1503264116251-35a269479413?auto=format&fit=crop&w=1350&q=80',
            fit: BoxFit.cover,
          ),
          // Contenido con botones centrados y separados
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text("GALERIA"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => galeria()),
                    );
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("HOME"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => home_screen()),
                    );
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("LOGIN"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("CALCULADORA"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => calculadora()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
