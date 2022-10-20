import 'package:get/get.dart';

import '../../../../../log.dart';

class BController extends GetxController {
  var age = '';
  @override
  void onInit() {
    super.onInit();
    var map = Get.arguments;
    Log.e(map.toString(), tag: 'aaa');
    age = map['age'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
