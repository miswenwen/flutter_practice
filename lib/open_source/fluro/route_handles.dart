import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../origin/Button/button_learn.dart';
import '../../origin/Icon/icon_learn.dart';
import '../../origin/Image/image_learn.dart';

//路由映射
var iconHandler = Handler(handlerFunc: (context, params) {
  return IconRoute();
});
var buttonHandler = Handler(handlerFunc: (context, params) {
  return ButtonRoute();
});
var imageHandler = Handler(handlerFunc: (context, params) {
  return ImageRoute();
});
