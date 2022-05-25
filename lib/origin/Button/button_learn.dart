import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

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
  int count = 0;

  //网络io和文件io在dart里是异步io，所以不会阻塞主线程。
  void download() async {
    Directory? _path = await getExternalStorageDirectory();
    String _localPath = '${_path?.path}${Platform.pathSeparator}京$count.apk';
    print('localpath:$_localPath');
    Response response = await Dio().download(
        'https://gdown.baidu.com/appcenter/pkg/upload/6492a4814e1b7dca6dc618a0b6f82c18',
        _localPath);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Button Learn')),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              count++;
              print('count:$count');
              download();
            },
            child: Text('AAA'),
          ),
          //命名构造方法可以加icon
          ElevatedButton.icon(
            onPressed: () {
              count++;
              print('count:$count');
            },
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
          Text('count: $count'),
        ],
      ),
    );
  }
}
