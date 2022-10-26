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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            child: Text('request permission'),
            onPressed: () {
              requestPermissions();
            },
          ),
          ElevatedButton(
            child: Text('request storage'),
            onPressed: () {
              requestStorage();
            },
          ),
          ElevatedButton(
            child: Text('request location'),
            onPressed: () {
              requestLocation();
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //requestPermissions();
  }

  //N个权限，直接申请，一次性申请
  Future requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.sms,
    ].request().catchError((e) {
      Log.e(e, tag: 'potter');
    });
    Log.e(statuses.toString(), tag: 'potter');
  }

  Future<void> requestStorage() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request().catchError((e) {
      Log.e(e, tag: 'potter');
    });
    Log.e(statuses.toString(), tag: 'potter');
  }

  Future<void> requestLocation() async {
    //先请求权限，然后在判断定位是否打开
    var status = await Permission.location.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request().catchError((e) {
        Log.e(e, tag: 'potter');
      });
      Log.e(statuses.toString(), tag: 'potter');
    } else if (status.isPermanentlyDenied) {
      openAppSettings(); //实测打开的当前应用的对应设置项，也就是pkgName已经包含进去了
    }
    if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
      Log.e('locationWhenInUse isEnabled', tag: 'potter');
    }
  }
}
