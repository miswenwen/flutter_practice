import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../log.dart';
import 'b_controller.dart';

class BPage extends StatefulWidget {
  const BPage({Key? key}) : super(key: key);

  @override
  _BPageState createState() => _BPageState();
}

class _BPageState extends State<BPage> {
  final controller = Get.put(BController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('age ${controller.age}'),
            ElevatedButton(
                onPressed: () {
                  Get.to(CPage());
                },
                child: Text('ToC')),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<BController>();
    super.dispose();
  }
}

class CPage extends StatelessWidget {
  const CPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var map = Get.arguments;
    Log.e(map.toString(), tag: 'aaa');
    var age = map['age'];
    return Scaffold(
      body: Center(
        child: Text(age),
      ),
    );
  }
}
