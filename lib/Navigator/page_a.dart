import 'package:flutter/material.dart';

/*
路由管理
Navigator的pop or push
A跳转B，传值可以通过B构造方法的形参传值过去
B出栈，返回A，给A传值 ，通过pop方法,这里有点神奇，A跳B调用push的时候async和await是不能省的
 */
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
      home: PageA(),
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('PageA'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            //如果B返回，A想拿值的话，实测async和await不能省略，而且push方法返回的是一个Future啊，Future怎么打印出来字符串的
            onPressed: () async {
              var result =  await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PageB(text: 'Data from A');
                  },
                ),
              );
              print('potter :$result');
            },
            child: Text('Jump'),
          ),
        ],
      ),
    );
  }
}

class PageB extends StatelessWidget {
  //A跳B传值 靠B的构造方法的形参传值
  PageB({Key? key, required this.text}) : super(key: key) {
    //print('BBBBBB');
  }

  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('PageA'),
      ),
      body: Column(
        children: <Widget>[
          Text('$text'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'Close B');
            },
            child: Text('close'),
          ),
        ],
      ),
    );
  }
}
