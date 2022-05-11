import 'package:fluro/fluro.dart';
import 'package:flutter_practice/open_source/fluro/route_handles.dart';

class Routes {
  static String page_home = '/'; //首页一定要用“/”进行配置,why?
  static String page_a = '/a';
  static String page_b = '/b';
  static String page_c = '/c';

  static void configureRoutes(FluroRouter router) {
    router.define(page_home, handler: homeHandler);
    router.define(page_a, handler: iconHandler);
    router.define(page_b, handler: buttonHandler);
    router.define(page_c, handler: imageHandler);
    //空页面
    router.notFoundHandler = homeHandler;
  }
}
