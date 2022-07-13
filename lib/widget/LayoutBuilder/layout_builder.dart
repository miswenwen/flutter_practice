import 'package:flutter/material.dart';

///可以使用 LayoutBuilder 来根据设备的尺寸来实现响应式布局
///实际使用的场景很少，比如我们实现一个响应式的 Column 组件 ResponsiveColumn，它的功能是当当前可用的宽度小于 200 时，
///将子组件显示为一列，否则显示为两列
class LayoutBuilderLearn extends StatefulWidget {
  const LayoutBuilderLearn({Key? key}) : super(key: key);

  @override
  State<LayoutBuilderLearn> createState() => _LayoutBuilderLearnState();
}

class _LayoutBuilderLearnState extends State<LayoutBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        print(constraints.maxHeight);
        print(constraints.maxWidth);
        return Text('sss');
      },
    );
  }
}
