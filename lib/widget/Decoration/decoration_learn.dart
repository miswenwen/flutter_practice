import 'package:flutter/material.dart';

///BoxDecoration放在Container的decoration属性里面
///或者放在DecoratedBox的decoration里面
///最常见的是borderRadius属性用来画圆角borderRadius: BorderRadius.circular(3.0)，偶尔边框也用的上
///其它效果有渐变，阴影，边框

///一般用Container包Decoration就行了，除非是前景装饰用DecoratedBox，例如我们照相里常见的概念遮罩
///
///
///   const BoxDecoration({
/*const BoxDecoration({
this.color,
this.image,
this.border,//边框
this.borderRadius,//圆角
this.boxShadow,
this.gradient,
this.backgroundBlendMode,
this.shape = BoxShape.rectangle,
}
BoxShape可以取值矩形rectangle或者圆形circle

*/
class DecorationLearn extends StatefulWidget {
  const DecorationLearn({Key? key}) : super(key: key);

  @override
  State<DecorationLearn> createState() => _DecorationLearnState();
}

class _DecorationLearnState extends State<DecorationLearn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DecoratedBox(
          position: DecorationPosition.background,
          //position: DecorationPosition.foreground,//某些情况需要用到前景
          decoration: BoxDecoration(),
        ),
        Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border(
              top: BorderSide(
                width: 10,
                color: Colors.green,
                strokeAlign: StrokeAlign.inside, //这里还可以取值center还有outside，但是会报错，回头再研究用法吧
              ),
              bottom: BorderSide(
                width: 10,
                color: Colors.yellow,
                strokeAlign: StrokeAlign.inside,
              ),
            ),
            //borderRadius: BorderRadius.circular(3.0), //border和borderRadius竟然不能同时用，那我要画带弧形的边框怎么搞？回头研究吧
          ),
          child: Text('ssss'),
        ),
      ],
    );
  }
}
