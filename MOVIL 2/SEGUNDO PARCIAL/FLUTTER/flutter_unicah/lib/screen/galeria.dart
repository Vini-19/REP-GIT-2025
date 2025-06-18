import 'package:flutter/material.dart';

class galeria extends StatelessWidget {
  const galeria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 52, 224, 138),
        title: Text("GALERIA"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(60.0),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2025/01/30/13/04/woman-9370170_1280.jpg",
            ),
          ),
          Text("Mujer con sonbria"),
          //primer
          Container(
            padding: EdgeInsets.all(60.0),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2025/01/30/13/04/woman-9370170_1280.jpg",
            ),
          ),
          Text("Mujer con sonbria"),
          //segundo
          Container(
            padding: EdgeInsets.all(60.0),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2025/01/30/13/04/woman-9370170_1280.jpg",
            ),
          ),
          Text("Mujer con sonbria"),
          //tercero
          Container(
            padding: EdgeInsets.all(60.0),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2025/01/30/13/04/woman-9370170_1280.jpg",
            ),
          ),
          Text("Mujer con sonbria"),
        ],
      ),
    );
  }
}
