import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

class WillPopScopeRoute extends StatefulWidget {
  const WillPopScopeRoute({Key? key}) : super(key: key);

  @override
  State<WillPopScopeRoute> createState() => _WillPopScopeRouteState();
}

class _WillPopScopeRouteState extends State<WillPopScopeRoute> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(),
      ),
      onWillPop: () async {
        var result = await _dialogExitApp(context);
        print(result);
        return result ??= true;
      },
      //强转类型竟然不行，必须得上面的写法
      // onWillPop: ()  {
      //   return (_dialogExitApp(context) as Future<bool>);
      //
      // },
      // onWillPop: ()  {
      //   return exitApp();
      //   return twiceThenExit();
      // },
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
      if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 1)) {
        //两次点击间隔超过1秒则重新计时
        _lastPressedAt = DateTime.now();
        return false;
      }
      return true;
    });
  }

  //这个有点问题，实测是AlertDialog的Btn没效果，后面解决了，不用as，而是用??=解决了
  //这里的原理有点像A界面跳B界面，B界面退出，返回值给A
  //这里就是当前界面跳AlertDialog，pop实际是干掉的dialog，然后返回false或者true。
  Future<bool?> _dialogExitApp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        content: new Text("是否退出1"),
        actions: <Widget>[
          new ElevatedButton(
              onPressed: () async {
                print('1111');
                Navigator.of(context).pop(false);
              },
              child: new Text("取消")),
          new ElevatedButton(
              onPressed: () async {
                print('2222');
                Navigator.pop(context, true);
                //Navigator.of(context).pop(true);
              },
              child: new Text("确定"))
        ],
      ),
    );
  }
}
