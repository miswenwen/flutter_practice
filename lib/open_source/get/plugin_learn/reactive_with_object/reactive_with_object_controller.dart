import 'package:get/get.dart';

class ReactiveWithObjectController extends GetxController {
  var serviceItem = ServiceItem('potter', 'add').obs;

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

class ServiceItem {
  String serviceName;
  String serviceIcon;

  ServiceItem(this.serviceName, this.serviceIcon);
}
