import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'A': (context) => NetWorkRoute(),
      },
      initialRoute: 'A',
      // home: NetWorkRoute(),
    );
  }
}

class NetWorkRoute extends StatefulWidget {
  @override
  State<NetWorkRoute> createState() {
    return NetWorkRouteState();
  }
}

class NetWorkRouteState extends State<NetWorkRoute> {
  String _networkContent = '';
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetWork Learn'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text('Get'),
            onPressed: () {
              _loading ? null : request1();
            },
          ),
          Text('$_networkContent'),
        ],
      ),
    );
  }

  request() async {
    setState(() {
      _loading = true;
      _networkContent = 'requesting...';
    });
    try {
      HttpClient httpClient = HttpClient();
      Uri uri = Uri(scheme: 'https', host: 'www.baidu.com');
      //两种写法,注意这里返回的是Future对象，发送请求
      //HttpClientRequest httpClientRequest = await httpClient.getUrl(uri);
      HttpClientRequest httpClientRequest =
          await httpClient.getUrl(Uri.parse('https://www.baidu.com'));
      //UA不能省
      httpClientRequest.headers.add(
        "user-agent",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1",
      );
      //httpClientRequest.headers.add("user-agent", "test");
      //等待response
      HttpClientResponse httpClientResponse = await httpClientRequest.close();
      //从response里解析数据
      _networkContent = await httpClientResponse.transform(utf8.decoder).join();
      print(_networkContent);
      //请求结束，关闭连接
      httpClient.close();
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  //采用DIO
  request1() async{
    Dio dio = Dio();
    Response response;
    response = await dio.get('https://www.baidu.com');
    print('potter' + response.data.toString());
  }
}
