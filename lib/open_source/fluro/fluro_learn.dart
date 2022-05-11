import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/open_source/fluro/application.dart';
import 'package:flutter_practice/open_source/fluro/routes.dart';


//fluro和Navigator对比优势来哪呢，写了一下和 Navigator配合命名路由没啥区别啊
void main() {
  FluroRouter router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      onGenerateRoute: Application.router.generator,
    );
  }
}

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(onPressed: (){
            Application.router.navigateTo(context, Routes.page_a);
          }, child: Text('Jump'))
        ],
      ),
    );
  }
}
