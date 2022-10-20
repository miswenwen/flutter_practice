import 'package:get/get.dart';

///总体来说，如果是采用update()这种手动刷新的方式，然后View层最外层用GetBuilder去包(或者局部刷新的地方用GetBuilder包)
///那么效果和Stacked里的用法是一样的(采用notifyListeners()去刷新一个道理)
class EasyWayController extends GetxController {
  var count = 0;

  void increase() {
    ++count;
    //注意update刷新的范围，
    //注释里写的是Rebuilds `GetBuilder` each time you call `update()`;
    update();
  }
}
