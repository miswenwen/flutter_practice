import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
void main() {
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
      home: WillPopScopeRoute(),
    );
  }
}

class WillPopScopeRoute extends StatefulWidget {
  const WillPopScopeRoute({Key? key}) : super(key: key);

  @override
  State<WillPopScopeRoute> createState() => _WillPopScopeRouteState();
}

class _WillPopScopeRouteState extends State<WillPopScopeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //final WillPopCallback? onWillPop;
      //typedef WillPopCallback = Future<bool> Function();
      body: WillPopScope(
        onWillPop: () {
          //return exitApp();
          return (_dialogExitApp(context) as Future<bool>);
          //return twiceThenExit();
        },
        child: Container(),
      ),
    );
  }

  //相当于监听back键，准确的说是 当前页面将要被pop时触发的回调
  Future<bool> exitApp() {
    return Future(() {
      print('back pressed');
      return false;
    });
  }

  DateTime? _lastPressedAt;

  Future<bool> twiceThenExit() {
    return Future(() {
      print('back pressed222');
      print(DateTime.now());
      print(_lastPressedAt);
      if (_lastPressedAt == null ||
          DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 1)) {
        //两次点击间隔超过1秒则重新计时
        _lastPressedAt = DateTime.now();
        return false;
      }
      return true;
    });
  }

  //这个有点问题，实测是AlertDialog的Btn没效果
  Future<bool?> _dialogExitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          content: new Text("是否退出"),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  print('1111');
                  Navigator.of(context).pop(false);
                },
                child: new Text("取消")),
            new FlatButton(
                onPressed: () {
                  print('2222');
                  Navigator.of(context).pop(true);
                },
                child: new Text("确定"))
          ],
        ));
  }
}