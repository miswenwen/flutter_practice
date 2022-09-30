import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

//除了ClipOval，ClipRRect外，还有ClipPath，可以自定义裁剪的曲线，贝塞尔曲线，折线等
class ClipLearn extends StatefulWidget {
  const ClipLearn({Key? key}) : super(key: key);

  @override
  State<ClipLearn> createState() => _ClipLearnState();
}

class _ClipLearnState extends State<ClipLearn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: pic(),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
          ),
          child: pic(),
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: pic(),
        ),
        ClipRRect(
          //Clip:取值有none,hardEdge,antiAlias,antiAliasWithSaveLayer
          //默认是antiAlias也就是抗锯齿，hardEdge是有锯齿的，玩游戏的都懂
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: pic(),
        ),
      ],
    );
  }

  Widget pic() {
    return Image.asset(
      'images/one_piece.png',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
