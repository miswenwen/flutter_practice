import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'reactive_with_object_controller.dart';

class ReactiveWithObjectPage extends StatefulWidget {
  const ReactiveWithObjectPage({Key? key}) : super(key: key);

  @override
  _ReactiveWithObjectPageState createState() => _ReactiveWithObjectPageState();
}

class _ReactiveWithObjectPageState extends State<ReactiveWithObjectPage> {
  final controller = Get.put(ReactiveWithObjectController());

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Obx(() {
        return Column(
          children: [
            //引用的两种方式serviceItem().serviceName或者serviceItem.value.serviceName
            Text('${controller.serviceItem.value.serviceName}'),
            Text('${controller.serviceItem.value.serviceIcon}'),
            ElevatedButton(
              onPressed: () {
                //对象属性变化也有两种写法
                controller.serviceItem.update((item) {
                  item?.serviceName = 'wenwen';
                  item?.serviceIcon = 'delete';
                });
                // controller.serviceItem(
                //   ServiceItem('miswenwen', 'plus'),
                // );
              },
              child: Text('changeServiceItem'),
            ),
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    Get.delete<ReactiveWithObjectController>();
    super.dispose();
  }
}
