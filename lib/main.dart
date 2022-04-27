import 'package:flutter/material.dart';

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
  var widgetList = <Widget>[];

  @override
  Widget build(BuildContext context) {
    widgetList.add(Text('sss'));
    widgetList.add(Text('sss'));
    widgetList.add(Text('sss'));

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Potter'),
      ),
      body: ListView(
        children: widgetList,
      ),
    );
  }
}
