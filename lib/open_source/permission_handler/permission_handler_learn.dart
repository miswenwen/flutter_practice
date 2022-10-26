import 'package:flutter/material.dart';
import 'package:flutter_practice/open_source/permission_handler/permission_util.dart';
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
          ElevatedButton(
            child: Text('permissionUtil'),
            onPressed: () async {
              PermissionUtils.request(context, Permission.storage);
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

  //2022-10-26 11:29:50.171 31120-31213 flutter                 com.example.flutter_practice         I  potter before---PermissionStatus.denied
  // 2022-10-26 11:29:53.985 31120-31213 flutter                 com.example.flutter_practice         I  potter request---PermissionStatus.denied
  // 2022-10-26 11:29:54.003 31120-31213 flutter                 com.example.flutter_practice         I  potter after---PermissionStatus.denied
  // 2022-10-26 11:29:56.880 31120-31213 flutter                 com.example.flutter_practice         I  potter before---PermissionStatus.denied
  // 2022-10-26 11:29:58.103 31120-31213 flutter                 com.example.flutter_practice         I  potter request---PermissionStatus.permanentlyDenied
  // 2022-10-26 11:29:58.125 31120-31213 flutter                 com.example.flutter_practice         I  potter after---PermissionStatus.denied
  //为啥两种写法拿到status值不一样啊，这也太傻比了，去github的issues里看了下，提的最多的就是status的状态不对，兼容性这做的不行啊
  //也就是说暂时只有request()后返回的状态是正确的
  //实测request()会弹框两次，第一次request拒绝是denied，第二次拒绝则是permanentalDenied。
  //测试的话，务必要清除存储数据再进行测试。才能保证是没有使用痕迹的app的第一次启动。
  Future<void> requestStorage() async {
    var status = await Permission.storage.status;
    Log.e(status.toString(), tag: 'potter before');
    PermissionStatus status2 = await Permission.storage.request().catchError((e) {});
    Log.e(status2.toString(), tag: 'potter request');
    var status3 = await Permission.storage.status;
    Log.e(status3.toString(), tag: 'potter after');
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
      openAppSettings(); //实测打开的当前应用的对应设置项，也就是pkgName已经包含进去了,最好搞成对话框的形式
    }
    if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
      Log.e('locationWhenInUse isEnabled', tag: 'potter');
    }
  }
}
