import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

///wrap和row还有column的区别在于他可以自动折行
class WrapLearn extends StatefulWidget {
  const WrapLearn({Key? key}) : super(key: key);

  @override
  State<WrapLearn> createState() => _WrapLearnState();
}

class _WrapLearnState extends State<WrapLearn> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // 主轴(水平)方向间距
      runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.center, //沿主轴方向居中
      children: <Widget>[
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
        Text('sssssssss'),
      ],
    );
  }
}
