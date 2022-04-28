import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ButtonRoute(),
    );
  }
}
//Icons类的矢量图一览在https://fonts.google.com/icons?selected=Material+Icons
class ButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Button Learn')),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Text('AAA'),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.logout),
            label: Text('AAA1'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('BBB'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.delete),
            label: Text('BBB1'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('CCC'),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.place),
            label: Text('CCC1'),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.thumb_up),
          ),
        ],
      ),
    );
  }
}
