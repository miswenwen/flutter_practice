import 'package:get/get.dart';

import '../../../../log.dart';

// 2022-10-20 14:49:31.003  4375-4409  flutter                 com.example.flutter_practice         I  aaa---onInit begin
// 2022-10-20 14:49:31.003  4375-4409  flutter                 com.example.flutter_practice         I  aaa---onInit end
// 2022-10-20 14:49:31.006  4375-4409  flutter                 com.example.flutter_practice         I  aaa---initState
// 2022-10-20 14:49:31.006  4375-4409  flutter                 com.example.flutter_practice         I  aaa---build begin
// 2022-10-20 14:49:31.325  4375-4409  flutter                 com.example.flutter_practice         I  aaa---onReady begin
// 2022-10-20 14:49:31.325  4375-4409  flutter                 com.example.flutter_practice         I  aaa---onReady end
class ReactiveWithObjectController extends GetxController {
  var serviceItem = ServiceItem('potter', 'add').obs;

  /// Called immediately after the widget is allocated in memory.
  /// You might use this to initialize something for the controller.
  ///
  /// 和Stacked的onModelReady的回调是一个东西，也就是ReactiveWithObjectController创建的时候就会回调
  /// View层需要的第一帧的数据可以在这里初始化
  @override
  void onInit() {
    Log.e('onInit begin', tag: 'aaa');
    super.onInit();
    Log.e('onInit end', tag: 'aaa');
  }

  /// Called 1 frame after onInit(). It is the perfect place to enter
  /// navigation events, like snackbar, dialogs, or a new route, or
  /// async request.
  ///
  /// 官方建议在这里来做异步请求(网络，IO等)
  /// 之前Stacked是放在onModelReady的回调里面的，其实都没差。因为异步操作都是Future，Future都是post到队列尾部的，也是在build之后才执行的。
  /// 所以网络请求是放在onInit还是onReady里面基本差异不大。除非build方法里放了一些Future，可能会导致网络请求开始执行的时机被推后一些。
  /// onReady可以理解成View已经绘制完毕，一切就绪
  @override
  void onReady() {
    Log.e('onReady begin', tag: 'aaa');
    super.onReady();
    Log.e('onReady end', tag: 'aaa');
  }

  /// Called before [onDelete] method. [onClose] might be used to
  /// dispose resources used by the controller. Like closing events,
  /// or streams before the controller is destroyed.
  /// Or dispose objects that can potentially create some memory leaks,
  /// like TextEditingControllers, AnimationControllers.
  /// Might be useful as well to persist some data on disk.
  ///
  /// 一些资源的释放，比如scrollviewController，EventBus等等
  /// 包括一些数据的持久化也可以在这里做。 比如应用/页面退出时刻的数据可以在这里保存在本地，然后重新打开应用/页面的时候加载
  @override
  void onClose() {
    Log.e('onClose begin', tag: 'aaa');
    super.onClose();
    Log.e('onClose end', tag: 'aaa');
  }
}

class ServiceItem {
  String serviceName;
  String serviceIcon;

  ServiceItem(this.serviceName, this.serviceIcon);
}
