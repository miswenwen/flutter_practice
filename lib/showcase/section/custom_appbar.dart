import 'package:flutter/material.dart';
import 'package:flutter_practice/showcase/home_page_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class CustomAppBarSection extends ViewModelWidget<HomePageViewModel> {
  @override
  Widget build(BuildContext context, HomePageViewModel viewModel) {
    return Container(
      height: 44.w,
      width: double.infinity,
      //color: Colors.red,
      margin: const EdgeInsets.only(top: 24),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: selectorArea(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/images/home/msg.svg',
                  height: 20.w,
                  width: 20.w,
                ),
                SizedBox(width: 32.w),
                SvgPicture.asset(
                  'assets/images/home/qr_scan.svg',
                  height: 20.w,
                  width: 20.w,
                ),
                SizedBox(width: 22.w),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget selectorArea() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 20.w),
        Text('国家林业和草原局', style: TextStyle(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
        //SizedBox(width: 5.w),
        const Icon(Icons.arrow_drop_down, color: Colors.black, size: 22),
      ],
    );
  }
}
