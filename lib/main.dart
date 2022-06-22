import 'package:flutter/material.dart';
import 'package:flutter_practice/open_source/permission_handler/permission_handler_learn.dart';

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
        child: PermissionTest(),
      ),
    );
  }
}
