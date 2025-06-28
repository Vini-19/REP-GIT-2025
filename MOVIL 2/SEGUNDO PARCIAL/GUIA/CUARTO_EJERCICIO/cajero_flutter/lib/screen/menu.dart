import 'depositar.dart';
import 'retirar.dart';
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text("Depositar"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Depositar()),
                    );
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("Retirar"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Retirar()),
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
