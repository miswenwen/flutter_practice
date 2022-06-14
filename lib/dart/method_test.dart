void main() {
  //null也可以toString，打印'null'这个字符串
}

//一般函数
/*
注意，dart和java不一样，是不支持方法重载的，作为代替的是可选参数，不管是普通方法还是构造方法
 */
void methodZ() {}
/*
这里注意，我们在调用methodZ1的时候，如果是methodZ1(true,null)实际编译都不会让过的，因为有非空检查
只也是为什么后面的可选位置方法要加代表可空的?或者required或者给初始值，
因为可选位置方法在调用的时候可选参数没有加进去的话默认给的值就是null，只就过不了非空检查，导致编译检查过不了
 */
void methodZ1(bool isA, bool isB) {}

//匿名内部类
/*函数体,其实只是没有函数名而已
([[Type] param1[, …]]) {
  codeBlock;
};
 */
void methodA() {
  var list = ['a', 'b', 'c'];
  list.forEach((str) {
    print(str);
  });
}

/*
匿名函数可以直接赋给var，作为一个变量
调用的话就是
say('Hi');
cal(3,3);
注意:dart中，方法可以省略参数类型
 */
var say = (str) {
  print(str);
};
var cal = (int a, int b) {
  return a + b;
};
var cal2 = ((int a, int b) => a + b);

//可选参数,分为可选命名参数和可选位置参数
/*
注意，可选命名参数和可选位置参数的大前提是它们都是可选参数，也就是说我们在调用方法的时候，可选参数是有默认值的，是null或者我们赋予的初始值
大部分场景用的是可选命名参数

由于非空检查：可选参数要加代表可空的？或者required或者赋默认值
?就是告诉编译器这是nullability类型，告诉编译器如果为空，我后面自己会处理的。
调用的时候
  methodB3('Hi');
  methodB3('Hi',isA: true);
  methodB3('Hi',isB: true);
  methodB3('Hi',isA: true,isB: false);
 */
//可选命名参数
void methodB({bool? isA, bool? isB}) {}

void methodB1({required bool isA, required bool isB}) {}

void methodB2({bool isA = true, bool isB = false}) {}

void methodB3(String str, {bool? isA, bool? isB}) {}
//可选位置参数
/*
由于非空检查：可选参数要加代表可空的？或者赋默认值
?就是告诉编译器这是nullability类型，告诉编译器如果为空，我后面自己会处理的。

为什么可选位置参数不能加required，而可选命名参数可以加required
原因:
void methodC2([required bool isA, required bool isB]) {}
实际和
void methodC2(bool isA,bool isB) {}
是等效的，因为调用的时候写法一样

而
void methodB1({required bool isA, required bool isB}) {}
和
void methodB1(bool isA, bool isB) {}
不等效，因为调用的时候写法不一样
 */
void methodC(bool isA, [bool? isB, bool? isC]) {}

void methodC1(bool isA, [bool isB = true, bool isC = false]) {}
//void methodC2([required bool isA, required bool isB]) {}  //编译检查不通过Can't have modifier 'required' here.

// =>的使用,方法如果只有一条语句，用=>

void methodD(String str) => print(str);
/*
匿名内部类也可以用=>
 */
void methodD1() {
  var list = ['a', 'b', 'c'];
  list.forEach((str) => print(str));
}

/*
是=>而不是->;
没有return关键字,这里methodD2和methodD3是等效的
 */
int methodD2() => 3 + 3;

int methodD3() {
  return 3 + 3;
}

//构造方法
class Point {
  num? x, y;

  Point(num x, num y) {
    // 还有更好的方式来实现下面代码，敬请关注。
    this.x = x;
    this.y = y;
  }
}

class Point1 {
  late num x, y;

  Point(num x, num y) {
    this.x = x;
    this.y = y;
  }
}

/*
语法糖
 */
class Point2 {
  num x, y;

  Point2(this.x, this.y);
}

//命名构造函数
class Point3 {
  late num x, y;

  Point3(this.x, this.y);

  /*
  命名构造函数
  相当于把构造方法改了个名字
   */
  Point3.origin() {
    x = 0;
    y = 0;
  }

  /*
  下面两种写法等效，重定向构造函数
   */
  Point3.test(num x) {
    Point3(x, 0);
  }

  Point3.testX(num x) : this(x, 0);
}
