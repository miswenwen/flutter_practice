import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IconRoute(),
    );
  }
}

//Icons类的矢量图一览在https://fonts.google.com/icons?selected=Material+Icons
/*
导入自定义的矢量图，要放在fonts目录下，是ttf文件，类似fonts/iconfont.ttf，也要使用到IconData类，回头用到再说吧
像Android的Vector的xml还有svg格式怎么用？
在image_learn里面实测了，不支持，如果要用svg，要用三方包例如flutter_svg
 */
class IconRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
    icons += "\uE03e";
    icons += " \uE237";
    icons += " \uE287";
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Learn'),
      ),
      body: Column(
        children: <Widget>[
          //icons作为字体图标用Text进行显示和设置
          Text(
            icons,
            style: TextStyle(
              fontFamily: "MaterialIcons",
              fontSize: 24,
              color: Colors.cyanAccent,
            ),
          ),
          //用Icon类感觉方便点
          Icon(
            Icons.add,
            color: Colors.blue,
            size: 96,
          )
        ],
      ),
    );
  }
}
