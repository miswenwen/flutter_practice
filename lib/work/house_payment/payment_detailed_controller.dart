import 'package:get/get.dart';

class PaymentDetailedController extends GetxController {
  var heroTag;
  @override
  void onInit() {
    super.onInit();
    prepareDefaultData();
    var map = Get.arguments;
    heroTag = map['hero_tag'];
  }

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

  void prepareDefaultData() {}
}
