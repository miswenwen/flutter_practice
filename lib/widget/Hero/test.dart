import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class HeroLearn extends StatelessWidget {
  const HeroLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {
          Get.to(HeroPage2());
        },
        child: Hero(
          tag: 'pic1',
          child: Image.asset(
            'images/one_piece.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}

class HeroPage2 extends StatelessWidget {
  const HeroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HeroPage2'),
      ),
      body: Hero(
        tag: 'pic1',
        child: Image.asset(
          'images/one_piece.png',
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
