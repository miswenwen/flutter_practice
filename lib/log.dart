import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

///自定义Log类，方便打log筛选,用于打单条的
class Log {
  static void v(String msg, {String tag = ''}) {
    String prefix = tag.length == 0 ? '' : '$tag---';
    debugPrint(prefix + msg);
  }

  static void d(String msg, {String tag = ''}) {
    String prefix = tag.length == 0 ? '' : '$tag---';
    debugPrint(prefix + msg);
  }

  static void i(String msg, {String tag = ''}) {
    String prefix = tag.length == 0 ? '' : '$tag---';
    debugPrint(prefix + msg);
  }

  static void w(String msg, {String tag = ''}) {
    String prefix = tag.length == 0 ? '' : '$tag---';
    debugPrint(prefix + msg);
  }

  static void e(var msg, {String tag = ''}) {
    String prefix = tag.length == 0 ? '' : '$tag---';
    debugPrint(prefix + msg.toString());
  }
}

///类里面打印整个类的
class Logger {
  final String prefix;
  final String suffix;

  Logger(this.prefix, {this.suffix = ''}) {}

  void v(String msg) {
    debugPrint(prefix + msg + suffix);
  }

  void d(String msg) {
    debugPrint(prefix + msg + suffix);
  }

  void i(String msg) {
    debugPrint(prefix + msg + suffix);
  }

  void w(String msg) {
    debugPrint(prefix + msg + suffix);
  }

  void e(String msg) {
    debugPrint(prefix + msg + suffix);
  }
}
