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

  void initialise() async {
    logger.i('initialise');
    prepareDefaultData();
    // await loadCache();
    // notifyListeners();
    await loadRes();
    notifyListeners();
    //updateCache();
  }

  void prepareDefaultData() {}

  Future loadRes() {
    return Future(() => null);
  }
}
