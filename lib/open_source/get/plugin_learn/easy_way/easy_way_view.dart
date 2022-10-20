import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'easy_way_controller.dart';

class EasyWayPage extends StatefulWidget {
  const EasyWayPage({Key? key}) : super(key: key);

  @override
  _EasyWayPageState createState() => _EasyWayPageState();
}

class _EasyWayPageState extends State<EasyWayPage> {
  final easyWayController = Get.put(EasyWayController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //拿Controller有两种方式，一是用GetBuilder包，泛型这用对应的controller类名，因为对应实例是独一无二的
            //第二种方式就是EasyWayController controller = Get.find();
            GetBuilder<EasyWayController>(
              builder: (controller) {
                return Text('点击${controller.count}');
              },
            ),
            Text('点击${easyWayController.count}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          easyWayController.increase();
        },
      ),
    );
  }

  @override
  void dispose() {
    //controller默认和路由栈绑定在一起的。如果其他页面不用的话，页面销毁的时候手动回收掉
    Get.delete<EasyWayController>();
    super.dispose();
  }
}
