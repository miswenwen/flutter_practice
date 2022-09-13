import 'package:flutter/material.dart';
import 'package:flutter_practice/showcase/home_page_view_model.dart';
import 'package:flutter_practice/showcase/section/announcement.dart';
import 'package:flutter_practice/showcase/section/banner.dart';
import 'package:flutter_practice/showcase/section/common_tiles.dart';
import 'package:flutter_practice/showcase/section/custom_appbar.dart';
import 'package:flutter_practice/showcase/section/gov_notices.dart';
import 'package:flutter_practice/showcase/section/service_tiles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, model, child) {
        return Stack(
          children: [
            bgFrame(),
            mainFrame(),
          ],
        );
      },
    );
  }

  Widget bgFrame() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: Image.asset(
        'assets/images/home/bg_frame.png',
        fit: BoxFit.fill,
        width: 432.w,
        height: 288.w,
      ),
    );
  }

  Widget mainFrame() {
    return Container(
      child: Column(
        children: [
          CustomAppBarSection(),
          Container(
            margin: EdgeInsets.only(top: 200.w),
            width: double.infinity,
            height: 5000,
            color: Colors.yellow,
            child: Column(
              children: [
                CommonTilesSection(),
                AnnouncementSection(),
                ServiceTilesSection(),
                BannerSection(),
                GovNoticesSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
