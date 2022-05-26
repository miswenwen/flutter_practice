import 'package:flutter/material.dart';
import 'package:flutter_practice/origin/Button/button_learn.dart';
import 'package:flutter_practice/origin/GlobalKey/app.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GlobalKeyRoute(),
    );
  }
}

class GlobalKeyRoute extends StatelessWidget {
  // GlobalKey globalKey;
  // ValueKey valueKey;
  // ObjectKey objectKey;
  // UniqueKey uniqueKey;
  static GlobalKey<MixRouteState> mixRouteKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('hello'),
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                App.count++;
                mixRouteKey.currentState?.updateUI();
              },
              child: Text('aaa'),
            ),
            Text('Count ${App.count}'),
            MixRoute(
              key: mixRouteKey,
            ),
          ],
        ));
  }
}

class MixRoute extends StatefulWidget {
  const MixRoute({Key? key}) : super(key: key);

  @override
  State<MixRoute> createState() {
    return MixRouteState();
  }
}

class MixRouteState extends State<MixRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () {},
          child: Text('bbb'),
        ),
        Text('Count ${App.count}'),
      ],
    );
  }
  updateUI(){
    setState(() {
      print('ssss');
    });
  }
}
