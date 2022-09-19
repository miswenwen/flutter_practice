import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class SafeAreaTest extends StatelessWidget {
  const SafeAreaTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //scaffold没有appbar的时候，如果不用SafeArea包，文本会直接冲到StatusBar里面去
    return SafeArea(
      top: false,
      child: Text('data'),
    );
    //return Text('data');
  }
}
