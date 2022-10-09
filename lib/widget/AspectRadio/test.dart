import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class AspectRadioLearn extends StatefulWidget {
  const AspectRadioLearn({Key? key}) : super(key: key);

  @override
  State<AspectRadioLearn> createState() => _AspectRadioLearnState();
}

//注意：AspectRatio 宽高比是相对父容器的，宽是父容器的宽，高是根据指定的比例计算出来的
class _AspectRadioLearnState extends State<AspectRadioLearn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          'assets/images/2.jpg',
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
