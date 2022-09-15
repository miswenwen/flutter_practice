import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../home_page_view_model.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class GovNoticesSection extends ViewModelWidget<HomePageViewModel> {
  @override
  Widget build(BuildContext context, HomePageViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(top: 18.w),
      child: Column(
        children: [
          titleArea(),
          listArea(),
        ],
      ),
    );
  }

  Widget titleArea() {
    return Container(
      height: 45.w,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '政策通知',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '更多内容',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF969696),
                  ),
                ),
                SizedBox(width: 6.w),
                Image.asset(
                  'assets/images/home/right_arrow.png',
                  width: 4.5.w,
                  height: 9.5.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listArea() {
    return Container();
  }
}
