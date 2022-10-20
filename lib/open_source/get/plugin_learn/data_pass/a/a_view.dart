import 'package:flutter/material.dart';
import 'package:flutter_practice/open_source/get/plugin_learn/data_pass/b/b_view.dart';
import 'package:get/get.dart';

import 'a_controller.dart';

///路由间数据传递学习
///传递
///Get.to(BPage, arguments: {'msg': '12345'});
///接收
///var map = Get.arguments;
///var msg = map['msg'];
///看api似乎是全局的一个k-v的map啊。这样数据不是可能在别的地方被获取和篡改吗？
///实测并不会,实测是A跳B，A给B传数据，B直接跳C。在C里面拿arguments，实际arguments的对象是动态的，和当前路由有关
///dynamic get arguments => routing.args;
///Routing get routing => _getxController.routing;
///
///var map = Get.arguments;
///Log.e(map.toString(), tag: 'aaa');
///打印Log可以看到
// 2022-10-20 15:41:43.276  4959-4993  flutter                 com.example.flutter_practice         I  aaa---{age: 20}
// 2022-10-20 15:41:49.045  4959-4993  flutter                 com.example.flutter_practice         I  aaa---null
///所以大大方方的用即可
class APage extends StatefulWidget {
  const APage({Key? key}) : super(key: key);

  @override
  _APageState createState() => _APageState();
}

class _APageState extends State<APage> {
  final controller = Get.put(AController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(
                  BPage(),
                  arguments: {'age': '20'},
                );
              },
              child: Text('ToB')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<AController>();
    super.dispose();
  }
}
