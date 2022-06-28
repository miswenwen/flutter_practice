import 'package:flutter/material.dart';
import 'package:flutter_practice/widget/ListView/archor_listview.dart';

/*
UI的常见嵌套：
main()
->runApp()
->MaterialApp
  theme
  home
->Scaffold
  appBar
  body
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Potter'),
      ),
      body: Container(
        child: ArchorTest(),
      ),
    );
  }
}
