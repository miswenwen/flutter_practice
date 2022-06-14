import 'package:flutter/material.dart';

void main() {
  print('potter');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: FrontBgRoute(),
    );
  }
}

class FrontBgRoute extends StatefulWidget {
  const FrontBgRoute({Key? key}) : super(key: key);

  @override
  State<FrontBgRoute> createState() => _FrontBgRouteState();
}

//State类里Mixin了WidgetsBindingObserver
class _FrontBgRouteState extends State<FrontBgRoute>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text('Test111'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //enum AppLifecycleState {
    //   resumed,
    //   inactive,
    //   paused,
    //   detached,
    // }
    //一般就是resumed和paused，对应android的activity的onResume和onPause
    //按home键,inactive=>paused
    //再进来resumed
    //退出inactive=>paused=>detached
    print('potter state $state');
    if (state == AppLifecycleState.resumed) {}
  }

  @override
  void initState() {
    super.initState();
    print('initState');
    //添加观察
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    //移除观察
    WidgetsBinding.instance.removeObserver(this);
  }
}
