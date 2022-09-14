import 'package:flutter/material.dart';
import 'package:flutter_practice/showcase/home_page_view_model.dart';
import 'package:flutter_practice/showcase/section/announcement.dart';
import 'package:flutter_practice/showcase/section/banner.dart';
import 'package:flutter_practice/showcase/section/common_tiles.dart';
import 'package:flutter_practice/showcase/section/custom_appbar.dart';
import 'package:flutter_practice/showcase/section/gov_notices.dart';
import 'package:flutter_practice/showcase/section/service_tiles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noripple_overscroll/noripple_overscroll.dart';
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
      onModelReady: (viewModel) {
        viewModel.initialise();
      },
      builder: (context, model, child) {
        return NoRippleOverScroll(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                bgFrame(),
                mainFrame(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget bgFrame() {
    return Image.asset(
      'assets/images/home/bg_frame.png',
      fit: BoxFit.fill,
      width: 375.w,
      height: 250.w,
    );
  }

  Widget mainFrame() {
    return Column(
      children: [
        CustomAppBarSection(),
        Container(
          margin: EdgeInsets.only(top: 146.w),
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
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
    );
  }
}
