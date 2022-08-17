/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

// good
typedef Predicate1<E> = bool Function(E element);

// bad
abstract class Predicate2<E> {
  bool test(E element);
}

// typedef 就是type defination
// 也就是新定义一个类型，定义一个新的对象类型，因为dart里方法也是对象。
// 方法的对象是Function，我们等于把Function类型改了个别名。

///假设一个应用场景，A类是个ButtonList，它的点击事件要从外部传，怎么设计
void main() {
  ButtonList buttonList = ButtonList((index) => print('触摸了 $index'));
  buttonList.touch(0);
  buttonList.touch(1);

  ButtonList2 buttonList2 = ButtonList2((index) => print('触摸了 $index'));
  buttonList2.touch(3);
  buttonList2.touch(4);
}

///使用typedef的写法,Function要什么参数，要几个参数都可以自己定义，Function的返回值也可以自己定义
typedef OnClick = Function(int index);
typedef OnClick2 = void Function(int index);
typedef IsChecked = bool Function(int index);

class ButtonList {
  OnClick onClick;

  ButtonList(this.onClick) {}

  touch(int index) {
    onClick(index);
  }
}

///不使用typedef的写法
class ButtonList2 {
  //Function是一种类型，代表这个Function赋值必须是(index){}，但是这种写法有一点点奇怪，和其他类新建对象的写法有些区别
  final Function(int index) onClick;

  //下面这两种创建对象的写法是普遍的，类名后面用()的貌似没有其他的了
  late String str;
  late List<int> list;

  ButtonList2(this.onClick);

  touch(int index) {
    onClick(index);
  }
}
