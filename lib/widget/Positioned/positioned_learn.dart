/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
import 'package:flutter/material.dart';

///Positioned一般和Stack配合使用
///同样的效果Stack+Align一样可以实现
///如果需要一些margin或者padding，Align里面再包一个Container即可
///Positioned的话要注意，Typically, Positioned widgets are placed directly inside Stack widgets.
///不要Stack包xxWidget，然后xxWidget包Positioned，会报错，此时debug版本可以正常显示，而release版本灰屏
class PositionedLearn extends StatefulWidget {
  const PositionedLearn({Key? key}) : super(key: key);

  @override
  State<PositionedLearn> createState() => _PositionedLearnState();
}

class _PositionedLearnState extends State<PositionedLearn> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 5,
          top: 5,
          child: Text('sss'),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Text('sss'),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Text('sss'),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Text('sss'),
        ),
      ],
    );
  }
}
