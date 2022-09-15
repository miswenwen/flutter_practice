import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../home_page_view_model.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class AnnouncementSection extends ViewModelWidget<HomePageViewModel> {
  @override
  Widget build(BuildContext context, HomePageViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(top: 15.w),
      width: double.infinity,
      height: 76.w,
      padding: EdgeInsets.only(left: 5.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F8FF),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          announcementIconArea(),
          announcementContentArea(),
        ],
      ),
    );
  }

  Widget announcementIconArea() {
    return Container(
      width: 63.w,
      height: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/home/announcement_bg.png',
              width: 40.w,
              height: 40.w,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/home/announcement.png',
              width: 40.w,
              height: 40.w,
            ),
          ),
          //竖分隔线
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 32.w,
              width: 1,
              color: const Color(0xFFD9D9D9),
            ),
          )
        ],
      ),
    );
  }

  Widget announcementContentArea() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 12.w, right: 19.w),
        //color: Colors.yellow,
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '纪检组于近日到访督查通知',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            Text(
              '纪检组于近日到访督查，请各单位积极配合,有问题及时反馈，请点对点传达...',
              style: TextStyle(
                color: Color(0xFF94A1C2),
                fontSize: 12.sp,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
