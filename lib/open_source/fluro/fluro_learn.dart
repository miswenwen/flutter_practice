import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/open_source/fluro/application.dart';
import 'package:flutter_practice/open_source/fluro/routes.dart';

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