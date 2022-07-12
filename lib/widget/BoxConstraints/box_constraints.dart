import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

///ConstrainedBox包，里面一个child，然后一个BoxConstraints，主要用来限定最大/最小宽高
class BoxConstraintsLearn extends StatefulWidget {
  const BoxConstraintsLearn({Key? key}) : super(key: key);

  @override
  State<BoxConstraintsLearn> createState() => _BoxConstraintsLearnState();
}

class _BoxConstraintsLearnState extends State<BoxConstraintsLearn> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 30,
        minWidth: 300,
      ),
      child: SizedBox(
        height: 50,
      ),
    );
  }
}
