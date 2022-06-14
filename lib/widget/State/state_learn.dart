import 'package:flutter/material.dart';

/*
场景，在A控件里拿到B控件，并调用B控件的api
例如Android里，Btn的click后，会调用某个TextView的setText，或者setVisible

class Builder extends StatelessWidget {

  const Builder({
    Key? key,
    required this.builder,
  }) : assert(builder != null),
       super(key: key);

  @override
  Widget build(BuildContext context) => builder(context);
}
typedef WidgetBuilder = Widget Function(BuildContext context);

为什么要用Builder包？
参考https://blog.csdn.net/petterp/article/details/111770747
 */

class StateLearnRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateLearnRouteState();
  }
}

class _StateLearnRouteState extends State<StateLearnRoute> {
  //定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('State Learn'),
      ),
      drawer: _MyDrawer(),
      body: Column(
        children: <Widget>[
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  //两种方式，注意要用Builder包起来
                  ScaffoldState _scaffoldState = Scaffold.of(context);
                  _scaffoldState.openDrawer();
                  ScaffoldState? _scaffoldState2 = context.findAncestorStateOfType<ScaffoldState>();
                  _scaffoldState2?.openDrawer();
                },
                child: Text('Press'),
              );
            },
          ),
          Text('AAA'),
          ElevatedButton(
            onPressed: () {
              /*
              GlobalKey的方式可以不用Builder包起来,
              globalKey.currentWidget获得该 widget 对象
              globalKey.currentElement来获得 widget 对应的element对象
              globalKey.currentState来获得该 widget 对应的state对象
              使用 GlobalKey 开销较大，如果有其他可选方案，应尽量避免使用它。另外，同一个 GlobalKey 在整个 widget 树中必须是唯一的，不能重复。
               */
              _globalKey.currentState?.openDrawer();
            },
            child: Text('Press2'),
          ),
        ],
      ),
    );
  }
}

class _MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer();
  }
}
