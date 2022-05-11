import 'dart:io';

import 'package:flutter/material.dart';

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
    widgetList.add(Text('1'));
    widgetList.add(Text('2'));
    widgetList.add(Text('3'));

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Potter'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Text('zzz'),
          ),
          Center(
            child: FutureBuilder<String>(
              future: getNetworkData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // 请求已结束
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    // 请求失败，显示错误
                    return Text("Error: ${snapshot.error}");
                  } else {
                    // 请求成功，显示数据
                    return Text("Contents: ${snapshot.data}");
                  }
                } else {
                  // 请求未结束，显示loading
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 5), () => '我是从互联网上获取的数据');
  }

  Future<String> getNetworkData() {
    return Future(() {
      //执⾏其他耗时操作
      int result = 0;
      for (int i = 0; i < 100000; i++) {
        result += i;
      }
      return "result:$result";
    });
  }
}