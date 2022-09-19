import 'package:flutter/material.dart';

///官方介绍
///https://www.youtube.com/watch?v=Zbm3hjPjQMk
///https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html

///Widget树从上到下共享数据
///abstract class InheritedWidget extends ProxyWidget,注意它是个抽象类
///abstract class ProxyWidget extends Widget
///可以说flutter的几大widget分别是StatelessWidget,StatefulWidget,InheritedWidget,<RenderObjectWidget>

///假设A Widget包了B和C两个Widget，内部要传输Person这个数据，首先看不用InheritedWidget我们会怎么写
///我们需要把Persion从BBB和CCC的构造方法里传进去。
///其实这个场景，我们自己在使用Stack这个mvvm框架，widget树里需要传输viewmodel的时候经常就用到了这种写法，我自己已经意识到是种很糟糕的写法了
///如果有N个子Widget，M个数据要共享，这不是芭比Q了,直接形参爆炸。

class Person {
  final String name;
  final int age;

  Person(this.name, this.age);
}

class AAA extends StatelessWidget {
  final Person person;

  const AAA(this.person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BBB(person),
        CCC(person),
      ],
    );
  }
}

class BBB extends StatelessWidget {
  final Person person;

  const BBB(this.person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(person.name),
    );
  }
}

class CCC extends StatelessWidget {
  final Person person;

  const CCC(this.person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(person.age.toString()),
    );
  }
}

///用InheritedWidget来写
class PersonData extends InheritedWidget {
  final Person person;

  const PersonData(this.person, {super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  //这里封装一个of方法，免得子widget里用context.dependOnInheritedWidgetOfExactType写的麻烦
  static PersonData of(BuildContext context) {
    final PersonData? result = context.dependOnInheritedWidgetOfExactType<PersonData>();
    assert(result != null, 'No PersonData found in context');
    return result!;
  }
}

class AA extends StatelessWidget {
  const AA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersonData(
      Person(
        'potter',
        30,
      ),
      child: Column(
        children: [
          BB(),
          CC(),
        ],
      ),
    );
  }
}

class BB extends StatelessWidget {
  const BB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(PersonData.of(context).person.name),
    );
  }
}

class CC extends StatelessWidget {
  const CC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(PersonData.of(context).person.age.toString()),
    );
  }
}
