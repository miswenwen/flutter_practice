import 'package:fluro/fluro.dart';
import 'package:flutter_practice/open_source/fluro/fluro_learn.dart';
import 'package:flutter_practice/widget/Button/button_learn.dart';
import 'package:flutter_practice/widget/Icon/icon_learn.dart';
import 'package:flutter_practice/widget/Image/image_learn.dart';

//路由映射
var homeHandler = Handler(handlerFunc: (context, params) {
  return HomeRoute();
});
var iconHandler = Handler(handlerFunc: (context, params) {
  return IconRoute();
});
var buttonHandler = Handler(handlerFunc: (context, params) {
  return ButtonRoute();
});
var imageHandler = Handler(handlerFunc: (context, params) {
  return ImageRoute();
});
