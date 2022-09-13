import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class ScreenUtilTest extends StatelessWidget {
  const ScreenUtilTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.yellow,
          height: 360.w,
          width: 360.w,
        ),
        Container(
          color: Colors.red,
          height: 360,
          width: 360,
        ),
      ],
    );
  }
}
