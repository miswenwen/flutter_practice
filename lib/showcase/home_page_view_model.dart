import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../log.dart';
import 'item.dart';

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

  ///gridview的资源
  List<ServiceTileItem> serviceList = [];

  ///common tiles的资源
  List<CommonTileItem> commonTileList = [];

  ///news的资源
  List<NewsItem> newsList = [];

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
    prepareServicesTileRes();
    prepareCommonTilesRes();
    prepareNewsRes();
  }

  Future loadRes() {
    return Future(() => null);
  }

  void prepareBannerRes() {
    bannerResList.add(Image.asset(width: 335.w, height: 83.w, 'assets/images/home/banner_1.png'));
    bannerResList.add(Image.asset(width: 335.w, height: 83.w, 'assets/images/home/banner_2.png'));
    //bannerResList.add(Image.asset(width: 335.w, height: 83.w, 'assets/images/home/banner_3.png'));
    bannerResList.add(Image.asset(width: 335.w, height: 83.w, 'assets/images/home/banner_4.png'));
    bannerResList.add(Image.asset(width: 335.w, height: 83.w, 'assets/images/home/banner_5.png'));
    bannerResList.add(Image.asset(width: 335.w, height: 83.w, 'assets/images/home/banner_6.png'));
    bannerResList.add(Image.asset(width: 335.w, height: 83.w, 'assets/images/home/banner_7.png'));
  }

  void prepareServicesTileRes() {
    // serviceList.add(ServiceTileItem('assets/images/home/store_house.svg', '数据仓库'));
    // serviceList.add(ServiceTileItem('assets/images/home/park_service.svg', '园区服务'));
    // serviceList.add(ServiceTileItem('assets/images/home/secretary_mailbox.svg', '书记信箱'));
    // serviceList.add(ServiceTileItem('assets/images/home/take_shot.svg', '随手拍'));
    // serviceList.add(ServiceTileItem('assets/images/home/dairy_manage.svg', '日志管理'));
    // serviceList.add(ServiceTileItem('assets/images/home/my_pocket.svg', '我的钱包'));
    // serviceList.add(ServiceTileItem('assets/images/home/visitor_invite.svg', '来访邀请'));
    // serviceList.add(ServiceTileItem('assets/images/home/more_apps.svg', '更多应用'));
    serviceList.add(ServiceTileItem('assets/images/home/store_house.png', '数据仓库'));
    serviceList.add(ServiceTileItem('assets/images/home/park_service.png', '园区服务'));
    serviceList.add(ServiceTileItem('assets/images/home/secretary_mailbox.png', '书记信箱'));
    serviceList.add(ServiceTileItem('assets/images/home/take_shot.png', '随手拍'));
    serviceList.add(ServiceTileItem('assets/images/home/dairy_manage.png', '日志管理'));
    serviceList.add(ServiceTileItem('assets/images/home/my_pocket.png', '我的钱包'));
    serviceList.add(ServiceTileItem('assets/images/home/visitor_invite.png', '来访邀请'));
    serviceList.add(ServiceTileItem('assets/images/home/more_apps.png', '更多应用'));
  }

  void prepareCommonTilesRes() {
    commonTileList.add(CommonTileItem('assets/images/home/contacts.png', '通讯录'));
    commonTileList.add(CommonTileItem('assets/images/home/attend.png', '考勤签到'));
    commonTileList.add(CommonTileItem('assets/images/home/house.png', '我的房屋'));
    commonTileList.add(CommonTileItem('assets/images/home/events.png', '事件管理'));
  }

  void prepareNewsRes() {
    newsList.add(NewsItem('关于推广数字办公的通知', '关于内部推广数字办公的通知内容的通知...', '2022-08-22 17:00', 'assets/images/home/speaker.png'));
    newsList.add(NewsItem('关于推广数字办公的通知', '关于内部推广数字办公的通知内容的通知...', '2022-08-22 17:00', 'assets/images/home/speaker.png'));
    newsList.add(NewsItem('关于推广数字办公的通知', '关于内部推广数字办公的通知内容的通知...', '2022-08-22 17:00', 'assets/images/home/speaker.png'));
    newsList.add(NewsItem('关于推广数字办公的通知', '关于内部推广数字办公的通知内容的通知...', '2022-08-22 17:00', 'assets/images/home/speaker.png'));
    newsList.add(NewsItem('关于推广数字办公的通知', '关于内部推广数字办公的通知内容的通知...', '2022-08-22 17:00', 'assets/images/home/speaker.png'));
  }
}
