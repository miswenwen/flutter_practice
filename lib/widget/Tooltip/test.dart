import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class TooltipLearn extends StatelessWidget {
  const TooltipLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Tooltip(
        //默认是长按触发，长按触发其实有点隐晦，说实话应用场景倒不如搞成点击触发，和点击跳转一起用，相当于中间穿插一个提示效果。
        //这种用法会比用toast要好，因为弹出的位置和跟踪widget本身的，可以突出重点。而不是像toast一样就在屏幕中间。
        triggerMode: TooltipTriggerMode.tap,
        message: 'aaa',
        preferBelow: false,
        //可以用富文本
        //richMessage: ,
        child: image(),
      ),
    );
  }

  Widget image() {
    return Image.asset(
      'images/one_piece.png',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }

  Icon icon() {
    return Icon(Icons.access_alarm_sharp);
  }
}
