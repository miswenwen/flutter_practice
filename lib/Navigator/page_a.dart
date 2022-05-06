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
      //命名路由，还要initialRoute指定首页，感觉比较直观,比使用home要酷一点,后面Navigator调用的时候可以用pushNamed等api来管理路由
      routes: {
        'A': (context) => PageA(),
        //注意这里PageB因为required 了 Text，可以用下面这种写法
        //'B': (context) => PageB(text: 'GOGOGO'),
        'B': (context) => PageB(text: ModalRoute.of(context)!.settings.arguments.toString()),
      },
      initialRoute: 'A',
      //home: PageA(),
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
              var result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PageB(text: 'Data from A');
                  },
                ),
              );
              //命名路由也可以传递数据
              // var result = await Navigator.pushNamed(
              //   context,
              //   'B',arguments: 'Data from A'
              // );
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
    //命名路由获取数据
    //var fromA = ModalRoute.of(context)?.settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('PageB'),
      ),
      body: Column(
        children: <Widget>[
          Text('$text'),
          //Text(fromA.toString()),
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
