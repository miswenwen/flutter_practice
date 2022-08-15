import 'package:flutter/material.dart';

///Widget树从上到下共享数据
///abstract class InheritedWidget extends ProxyWidget,注意它是个抽象类
///abstract class ProxyWidget extends Widget
class InheritedWidgetLearn extends StatefulWidget {
  const InheritedWidgetLearn({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetLearn> createState() => _InheritedWidgetLearnState();
}

class _InheritedWidgetLearnState extends State<InheritedWidgetLearn> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ShareDataWidget extends InheritedWidget {
  final int data; //需要在子树中共享的数据，保存点击次数
  ShareDataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    // return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>()!.widget;
  }

  ///这个是重写方法，该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  ///covariant  协变，参考https://blog.csdn.net/brooksjames/article/details/114485083
  @override
  bool updateShouldNotify(covariant ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }
}

///covariant的使用
abstract class Text {
  bool doSth(num data);
  //bool doSth2(num data);
}

class SSS extends Text {
  @override
  bool doSth(covariant int data) {
    // TODO: implement doSth
    throw UnimplementedError();
  }

  ///没有covariant 会报错
  // @override
  // bool doSth2(int data) {
  //   // TODO: implement doSth2
  //   throw UnimplementedError();
  // }

}
