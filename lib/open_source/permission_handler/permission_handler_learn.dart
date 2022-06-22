import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../log.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

class PermissionTest extends StatefulWidget {
  const PermissionTest({Key? key}) : super(key: key);

  @override
  State<PermissionTest> createState() => _PermissionTestState();
}

class _PermissionTestState extends State<PermissionTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Permission'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
    ].request().catchError((e) {
      Log.e(e, tag: 'potter');
    });
    Log.e(statuses[Permission.location].toString(), tag: 'potter');
  }
}
