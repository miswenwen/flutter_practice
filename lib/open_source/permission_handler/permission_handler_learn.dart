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
            onPressed: () async {
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

  //I/flutter (10138): potter before---PermissionStatus.denied
  // I/flutter (10138): potter---PermissionStatus.permanentlyDenied
  // I/flutter (10138): potter after---PermissionStatus.denied
  //为啥两种写法拿到status值不一样啊，这也太傻比了，去github的issues里看了下，提的最多的就是status的状态不对，兼容性这做的不行啊
  Future<void> requestStorage() async {
    var status = await Permission.storage.status;
    Log.e(status.toString(), tag: 'potter before');
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request().catchError((e) {
      Log.e(e, tag: 'potter');
    });
    await Permission.storage.request().catchError((e) {});
    Log.e(statuses[Permission.storage], tag: 'potter');
    var status2 = await Permission.storage.status;
    Log.e(status2.toString(), tag: 'potter after');
  }

  Future<void> requestLocation() async {
    //先请求权限，然后在判断定位是否打开
    var status = await Permission.location.status;
    var status1 = await Permission.locationAlways.status;
    var status2 = await Permission.locationWhenInUse.status;
    Log.e('location' + status.toString(), tag: 'potter333');
    Log.e('locationAlways' + status1.toString(), tag: 'potter333');
    Log.e('locationWhenInUse' + status2.toString(), tag: 'potter333');
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
