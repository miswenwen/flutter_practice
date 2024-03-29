import 'dart:math';

import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class WithToolbar extends StatefulWidget {
  final String title;
  final Function? backBehavior;
  final Widget child;

  const WithToolbar({
    Key? key,
    required this.title,
    required this.child,
    this.backBehavior,
  }) : super(key: key);

  @override
  State<WithToolbar> createState() => _WithToolbarState();
}

class _WithToolbarState extends State<WithToolbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        toolbar(),
        widget.child ?? Container(),
      ],
    );
  }

  Widget toolbar() {
    return Container(
      width: double.infinity,
      height: 88,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 44),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () async {
                if (widget.backBehavior == null) {
                  Navigator.pop(context);
                } else {
                  widget.backBehavior!();
                }
              },
              // child: Container(
              //   width: 30,
              //   height: double.infinity,
              //   child: Image.asset(
              //     'assets/images/home/contacts.png',
              //     height: 18,
              //     width: 10,
              //   ),
              // ),
              child: Container(
                width: 40,
                height: double.infinity,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

int random(int min, int max) {
  final _random = Random();
  return min + _random.nextInt(max - min + 1);
}

Color randomColor() {
  return Color.fromARGB(random(150, 255), random(0, 255), random(0, 255), random(0, 255));
}
