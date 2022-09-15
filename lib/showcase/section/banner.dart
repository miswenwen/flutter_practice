import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:stacked/stacked.dart';

import '../home_page_view_model.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

///对比
///flutter_swiper：3年未更新，不支持null-safety，run args里得新增--no-sound-null-safety,要不然跑不起来
///carouselslider: 什么都比flutter_swiper好，唯一的缺点是没有indicator，也就是没有内置那种多个指示点，官方demo也是让自己画 离谱
class BannerSection extends ViewModelWidget<HomePageViewModel> {
  @override
  Widget build(BuildContext context, HomePageViewModel viewModel) {
    return false ? carouselSliderWay(viewModel) : flutterSwiperWay(viewModel);
  }

  Widget carouselSliderWay(HomePageViewModel viewModel) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: CarouselSlider(
        items: viewModel.bannerResList,
        options: CarouselOptions(viewportFraction: 1, height: 83.w),
        carouselController: CarouselController(),
      ),
    );
  }

  Widget flutterSwiperWay(HomePageViewModel viewModel) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      //color: Colors.yellow,
      margin: EdgeInsets.only(top: 10.w),
      height: 83.w,
      child: Swiper(
        autoplay: true,
        scale: 1,
        itemCount: viewModel.bannerResList.length,
        index: 0,
        outer: false,
        itemBuilder: (BuildContext context, int index) {
          return viewModel.bannerResList[index];
        },
        pagination: const SwiperPagination(
          margin: EdgeInsets.all(0),
          builder: DotSwiperPaginationBuilder(
            size: 4,
            activeSize: 6,
            activeColor: Colors.white,
            color: Colors.white,
            space: 6,
          ),
        ),
      ),
    );
  }
}
