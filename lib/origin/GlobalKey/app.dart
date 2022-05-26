import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class App {
  //定义私有命名构造方法，此时会取代默认的公开的构造方法
  App._getInstance();

  //最简洁的只用个下划线 来表示私有构造方法也可以
  //App._();
  //典型的饿汉式单例，类初始化的时候就创建了对象
  static final App _instance = App._getInstance();
  static  int count = 0;

  //下面几种方式获取单例都可以，factory修饰的构造方法就是可以带有返回值，第二种就和java里传统的写法一致，调用的话明显factory修饰的构造方法会简洁些
  factory App() {
    return _instance;
  }

  //java里传统写法
  static App getInstance() {
    return _instance;
  }

  //使用get来写
  static App get instance {
    return _instance;
  }

  //get配合=>,=>表达式是需要省略 return的
  static App get instance1 => _instance;

  //可以省略返回的类型声明，但不推荐
  static get instance2 => _instance;
}

//常量和工厂构造
class AppNew {
  const AppNew._internal();

  factory AppNew() {
    return AppNew._internal();
  }
}
