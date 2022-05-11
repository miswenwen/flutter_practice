//Function和typedef关键字理解
import 'package:flutter/material.dart';

void main() {
  //这里要提供Fly的具体实现
  Bird bird = Bird((str) {
    print('fly $str');
  });
  bird.fly('I\'m flying');
}

// 定义一个类型（方法），该方法需要传入一个int参数
typedef Fly = void Function(String str);

class Bird {
  Fly fly;

  Bird(this.fly);
}

// 返回一个函数，返回的函数参数与 [addBy] 相加。这里返回的是一个Function对象
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

//定义一个方法为HandlerFunc，形参有两个，返回Widget对象，具体实现放在使用的时候
typedef Widget? HandlerFunc(
    BuildContext? context, Map<String, List<String>> parameters);

class SortedCollection {
  late Function compare;

  //下面这行怎么理解,相当于在使用的时候，自己要实现一个方法带有Object和int类型形参各一个，然后返回int值
  //例如 SortedCollection sortedCollection = SortedCollection((a, b) => b + 2);
  SortedCollection(int f(Object a, int b)) {
    compare = f;
  }
}

//下面两种写法是等效的
/*
  使用的时候
  Compare1 compare1 = ((a, b) {
    return 0;
  });
  Compare2 compare2 = ((a, b) {
    return 0;
  });
 */
typedef Compare1 = int Function(Object a, Object b);
typedef int Compare2(Object a, Object b);
