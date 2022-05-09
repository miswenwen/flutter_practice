/*
代码风格  规范

 */
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {}

// UpperCamelCase
// 大驼峰式命名法
// 每一个单字的首字母都采用大写字母
// 类名Classes，枚举Enum，类型定义typedefs，类型参数type parameters(方法的形参，泛型类型参数)

class Student {}

enum Color { red, green, blue }

typedef Go = bool Function<T>(T value);

// lowercase_with_underscores
// 库，包，文件夹，源文件
// 库：例如pubspec.yaml 我们引用的event_bus
// 包/文件夹：lib目录下我们新建的directory命名
// 源文件：xxx_xxx.dart
//
// sample:
// library peg_parser.source_scanner;
// import 'file_system.dart';（而不是import 'file-system.dart'; 或import 'fileSystem.dart';）
//
// 使用 lowercase_with_underscores 风格命名导入的前缀。
// import 'dart:math' as math;（而不是import 'dart:math' as Math;）

// lowerCamelCase
// 除了第一个单词，每个单词首字母都应大写，并且不使用分隔符
// 类成员、顶级定义、变量、参数以及命名参数等
//
// 在常量的命名上，个人认为无论lowerCamelCase或者uppercase_with_underscores都可以。
//
// 因为用uppercase_with_underscores可以从名字直接区分是常量还是变量
// 需要注意的是，如果选定了一种，那么一般的常量还有枚举里的常量都要保持一致的风格。

class Test {
  //常量,常量这里要注意点，和java里的不一样，java里面是uppercase_with_underscores
  static final numberGenerator =
      Random(); //而不是static final NUMBER_GENERATOR = Random();
  var item;
  late HttpClient httpClient;

  void doSomething(String str) {
    const pi = 3.14;
  }
}

//注意，枚举里的常量在dart里按照规范的话也是小写的，lowerCamelCase
enum Color1 { red, green, blue }

// 把超过两个字母的首字母大写缩略词和缩写词当做一般单词来对待
// 首字母缩略词：指取若干单词首字母组成一个新单词，如：HTTP = HyperText Transfer Protocol
// 缩写词：指取某一单词的部分字母（或其他缩短单词的方式）代表整个单词，如：ID = identification
// HttpClient而不是HTTPClient

//不要 使用前缀字母
//defaultTimeout 而不是kDefaultTimeout 或者mDefaultTimeout
//Note:这个有点奇怪，类的成员变量和方法体里的临时变量怎么区分呢？ （也就是全局变量和局部变量怎么区分呢）

// 不要 使用块注释作用作解释说明。
//可以使用块注释 (/* ... */) 来临时的注释掉一段代码， 但是其他的所有注释都应该使用 //。
greet(name) {
  // Assume we have a valid name.
  print('Hi, $name!');
}

greet1(name) {
  //错误的注释方式
  /* Assume we have a valid name. */
  print('Hi, $name!');
}

//dartdoc 支持两种格式的文档注释：/// (“C# 格式”) 和 /** ... */ (“JavaDoc 格式”),推荐///，注意是3个斜杠而不是2个
// 我个人理解这里说的是api文档
//例如framework.dart里面可以看到都是/// 注释

// 使用方括号在文档注释中引用作用域内的标识符。类似[StatefulWidget] and [State]
//      /// Throws a [StateError] if ...
//      /// similar to [anotherMethod()], but ...

//把注释文档放到注解之前。
class MyApp extends StatelessWidget {
  //This is build method
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

//这里的+是可以并且推荐省略的，分行且分段的字符串应该采用str1的这种方式
String str1 = 'ERROR: Parts of the spaceship are on fire. Other '
    'parts are overrun by martians. Unclear which are which.';
String str2 = 'ERROR: Parts of the spaceship are on fire. Other ' +
    'parts are overrun by martians. Unclear which are which.';

//推荐 使用插值的形式来组合字符串和值。应该采用str3的这种写法
String str3 = 'potter $str1';
String str4 = 'potter' + str1;

//List，Map的写法,应该采用头两种写法
var points = [];
var addresses = {};

var points1 = <String>[];
var addresses1 = <String, String>{};

// var points2 = List();
// var addresses2 = Map();

//判断是否为空的时候应该用isEmpty或者isNotEmpty,而不是用length去判断
bool isEmpty = points.isEmpty;
//bool isEmpty = points.length == 0;