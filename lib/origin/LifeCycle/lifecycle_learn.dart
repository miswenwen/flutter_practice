import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/*
enum _StateLifecycle {
  /// The [State] object has been created. [State.initState] is called at this
  /// time.
  created,

  /// The [State.initState] method has been called but the [State] object is
  /// not yet ready to build. [State.didChangeDependencies] is called at this time.
  initialized,

  /// The [State] object is ready to build and [State.dispose] has not yet been
  /// called.
  ready,

  /// The [State.dispose] method has been called and the [State] object is
  /// no longer able to build.
  defunct,    [dɪˈfʌŋkt]  不再存在的
}
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
      routes: {
        'A': (context) => Life(),
        'B': (context) => Life2(),
      },
      initialRoute: 'A',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String? routeName = settings.name;
          print('onGenerateRoute $routeName');
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其它情况则正常打开路由。
          if (routeName == 'c') {}
          return Life2();
        });
      },
    );
  }
}

class Life extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return Life2();
              //   },
              // ));
              Navigator.pushNamed(context, 'B');
              //Navigator.pushNamed(context, 'C');
            },
            child: Text('Jump'),
          ),
        ],
      ),
    );
  }
}

class Life2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Life2State();
  }
}

class Life2State extends State<Life2> {
  var logger = Logger(
    printer: PrettyPrinter(
        methodCount: 0,
        // number of method calls to be displayed
        errorMethodCount: 8,
        // number of method calls if stacktrace is provided
        lineLength: 120,
        // width of the output
        colors: true,
        // Colorful log messages
        printEmojis: false,
        // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );

  @override
  Widget build(BuildContext context) {
    logger.d("build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Life2'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    logger.d("dispose");
  }

  @override
  void deactivate() {
    super.deactivate();
    logger.d("deactivate");
  }

  @override
  void reassemble() {
    super.reassemble();
    logger.d("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    logger.d("didChangeDependencies");
  }

  @override
  void activate() {
    super.activate();
    logger.d("activate");
  }

  @override
  void initState() {
    super.initState();
    //verbose=>debug=>info=>warning=>error
    //logger.v("initState");
    logger.d("initState");
    // logger.i("initState");
    // logger.w("initState");
    // logger.d("initState");
    // logger.wtf("initState");
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(() {});
    logger.d("setState");
  }

  @override
  void didUpdateWidget(Life2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    logger.d("didUpdateWidget");
  }

// @override
// void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//
// }
}
