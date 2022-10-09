import 'dart:math';

import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class PlaceHolderLearn extends StatefulWidget {
  const PlaceHolderLearn({Key? key}) : super(key: key);

  @override
  State<PlaceHolderLearn> createState() => _PlaceHolderLearnState();
}

class _PlaceHolderLearnState extends State<PlaceHolderLearn> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Placeholder(
        fallbackHeight: 100,
        fallbackWidth: 20,
        strokeWidth: 10,
        color: randomColor(),
      ),
    ]);
  }

  int random(int min, int max) {
    final _random = Random();
    return min + _random.nextInt(max - min + 1);
  }

  Color randomColor() {
    return Color.fromARGB(random(150, 255), random(0, 255), random(0, 255), random(0, 255));
  }
}
