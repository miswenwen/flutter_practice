import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ez_way_reactive_controller.dart';

class EzWayReactivePage extends StatefulWidget {
  const EzWayReactivePage({Key? key}) : super(key: key);

  @override
  _EzWayReactivePageState createState() => _EzWayReactivePageState();
}

class _EzWayReactivePageState extends State<EzWayReactivePage> {
  final controller = Get.put(EzWayReactiveController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Text(
            '点击${controller.count}',
          );
        }),
        ElevatedButton(
          onPressed: () {
            controller.increase();
          },
          child: Text('increase'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.off(BlankA());
          },
          child: Text('Jump and remove current Route'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    //实测没有这句 controller会一直和路由栈绑定，一直存在
    Get.delete<EzWayReactiveController>();
    super.dispose();
  }
}

class BlankA extends StatelessWidget {
  const BlankA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Get.off(EzWayReactivePage());
        },
        child: Text(''),
      ),
    );
  }
}
