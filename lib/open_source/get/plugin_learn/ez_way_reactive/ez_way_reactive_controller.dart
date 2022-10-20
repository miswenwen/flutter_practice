import 'package:get/get.dart';

class EzWayReactiveController extends GetxController {
  var count = 0.obs;

  ///自增
  void increase() => ++count;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
