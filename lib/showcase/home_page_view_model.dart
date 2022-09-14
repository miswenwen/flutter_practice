import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../log.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class HomePageViewModel extends BaseViewModel {
  bool isResReady = false;
  bool isCacheLoaded = false;
  Logger logger = Logger('HomePageViewModel----');

  ///banner的资源
  List<Widget> bannerResList = [];

  void initialise() async {
    logger.i('initialise');
    prepareDefaultData();
    // await loadCache();
    // notifyListeners();
    await loadRes();
    notifyListeners();
    //updateCache();
  }

  void prepareDefaultData() {
    prepareBannerRes();
  }

  Future loadRes() {
    return Future(() => null);
  }

  void prepareBannerRes() {
    bannerResList.add(Image.asset(width: 335.w, height: 83.w, 'assets/images/home/banner_1.png'));
    bannerResList.add(Image.asset(width: 335.w, height: 83.w, 'assets/images/home/banner_1.png'));
    bannerResList.add(Image.asset(width: 335.w, height: 83.w, 'assets/images/home/banner_1.png'));
    bannerResList.add(Image.asset(width: 335.w, height: 83.w, 'assets/images/home/banner_1.png'));
    bannerResList.add(Image.asset(width: 335.w, height: 83.w, 'assets/images/home/banner_1.png'));
  }
}
