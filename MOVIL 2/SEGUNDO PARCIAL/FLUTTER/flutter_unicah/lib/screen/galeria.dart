//importar la libreria material
import 'package:flutter/material.dart';

class galeria extends StatelessWidget {
  const galeria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 72, 251),
        title: Text("GALERIA"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(60.0),
            child: Column(
              children: [
                Image.network(
                  "https://cdn.pixabay.com/photo/2021/01/30/15/14/akita-5964180_1280.jpg",
                ),
                SizedBox(height: 10),
                Center(child: Text("Bulldog francés")),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(60.0),
            child: Column(
              children: [
                Image.network(
                  "https://cdn.pixabay.com/photo/2020/12/21/08/36/dog-5849152_1280.jpg",
                ),
                SizedBox(height: 10),
                Center(child: Text("Golden retriever")),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(60.0),
            child: Column(
              children: [
                Image.network(
                  "https://cdn.pixabay.com/photo/2016/10/26/22/02/dog-1772759_1280.jpg",
                ),
                SizedBox(height: 10),
                Center(child: Text("Mastín.")),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(60.0),
            child: Column(
              children: [
                Image.network(
                  "https://cdn.pixabay.com/photo/2019/11/18/00/38/dog-4633734_1280.jpg",
                ),
                SizedBox(height: 10),
                Center(child: Text("Dóberman")),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(60.0),
            child: Column(
              children: [
                Image.network(
                  "https://cdn.pixabay.com/photo/2016/11/01/10/29/dog-1787835_1280.jpg",
                ),
                SizedBox(height: 10),
                Center(child: Text("DALMATA")),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(60.0),
            child: Column(
              children: [
                Image.network(
                  "https://cdn.pixabay.com/photo/2020/10/21/00/35/dog-5671778_1280.jpg",
                ),
                SizedBox(height: 10),
                Center(child: Text("GALGOS")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
