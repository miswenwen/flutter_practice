import 'package:flutter/material.dart';
import 'package:flutter_practice/general/toast.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../log.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class PermissionUtils {
  //应用第一次安装，权限status默认是denied
  //自评估和工信部两个要求
  //1.权限在调用的地方进行申请，而不是在进应用的时候一次性申请，故权限都是单个申请的。
  //2.权限申请的弹窗前要告知用户申请权限是用于什么功能的。故需要加额外的权限说明弹框。

  //对于permission_controller, request()这个api，给权限status==>granted,第一次不给权限status==>denied,第二次不给权限status==>permanentalDenied
  //note1:注意permission_handler目前有坑，兼容性问题，以我的oppo手机为例，下面的方法申请权限，连点两次拒绝。

  // 2022-10-26 11:29:50.171 31120-31213 flutter                 com.example.flutter_practice         I  potter before---PermissionStatus.denied
  // 2022-10-26 11:29:53.985 31120-31213 flutter                 com.example.flutter_practice         I  potter request---PermissionStatus.denied
  // 2022-10-26 11:29:54.003 31120-31213 flutter                 com.example.flutter_practice         I  potter after---PermissionStatus.denied
  // 2022-10-26 11:29:56.880 31120-31213 flutter                 com.example.flutter_practice         I  potter before---PermissionStatus.denied
  // 2022-10-26 11:29:58.103 31120-31213 flutter                 com.example.flutter_practice         I  potter request---PermissionStatus.permanentlyDenied
  // 2022-10-26 11:29:58.125 31120-31213 flutter                 com.example.flutter_practice         I  potter after---PermissionStatus.denied
  //两种写法拿到status值不一样，去github的issues里看了下，提的最多的就是status的状态不对，兼容性有问题,目前最新版本尚未fix(2022/10/26)
  //也就是说暂时只有request()后返回的状态是正确的
  //note2:测试的话，清除存储数据再进行测试。才能保证是没有使用痕迹的app的第一次启动。免得重装apk麻烦
  /*
    Future<void> requestStorage() async {
    var status = await Permission.storage.status;
    Log.e(status.toString(), tag: 'potter before');
    PermissionStatus status2 = await Permission.storage.request().catchError((e) {});
    Log.e(status2.toString(), tag: 'potter request');
    var status3 = await Permission.storage.status;
    Log.e(status3.toString(), tag: 'potter after');
  }
   */

  //调用Sample：PermissionUtils.request(context, Permission.storage);
  static Future<void> request(BuildContext context, Permission permission) async {
    PermissionStatus status = await permission.status;
    Log.e(status, tag: 'potter');
    if (status.isGranted) {
      //do nothing
    } else {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (context) {
          return alertDialog(context, permission);
        },
      );
    }
    // if (await permission.status.isGranted) {
    //   //do nothing
    // } else if (await permission.status.isDenied) {
    //   showDialog(
    //     context: context,
    //     barrierDismissible: false, // user must tap button!
    //     builder: (context) {
    //       return alertDialog(context, permission);
    //     },
    //   );
    // } else if (await permission.status.isPermanentlyDenied) {
    //
    // }
  }

  static Widget alertDialog(BuildContext context, Permission permission) {
    DialogInfo dialogInfo = getDialogInfo(permission);
    return AlertDialog(
      title: Text(dialogInfo.title!),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(dialogInfo.content!),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, '不允许'),
          child: const Text('不允许'),
        ),
        TextButton(
          onPressed: () async {
            PermissionStatus status = await permission.request().catchError((e) {});
            Log.e(status, tag: 'potter request result');
            if (status == PermissionStatus.granted) {
              //do nothing
            } else if (status == PermissionStatus.denied) {
              //do nonthing
            } else if (status == PermissionStatus.permanentlyDenied) {
              permanentalDeniedTreatment();
            }
            Navigator.pop(context, '好');
          },
          child: const Text('好'),
        ),
      ],
    );
  }

  static DialogInfo getDialogInfo(Permission permission) {
    if (permission == Permission.storage) {
      return DialogInfo(
        title: '居民通想要访问您的存储',
        content: '允许存储权限，确保您能使用xxx，xxx等功能',
      );
    }
    return DialogInfo(title: '', content: '');
  }

  static void permanentalDeniedTreatment() {
    /*好几种选择
      1.弹toast，提示---打开失败，请在设置-应用程序-一网统管中开启相关权限
      cmnt:最简单，cmcc的和包采用的该方式
      2.直接跳系统设置
      cmnt:有些粗暴
      3.跳转系统设置前给一个对话框，用户可以选择是否跳转。但是如果想要完美的体验，最好是监听权限的变化来 remove 这个对话框，而不是跳转的时候就remove。
      cmnt:合适的方式，oppo的camera采用该方式，但我们已经前置了一个对话框告知用户权限用来干嘛了，这个对话框的内容会有些重复
      4.啥也不做
      cmnt:不太好
       */
    //toast方式
    showShortToast('打开失败，请在设置-应用程序-居民通中开启相关权限');
    //直接跳转方式
    //openAppSettings();
    //对话框跳转方式
  }
}

class DialogInfo {
  String? title;
  String? content;

  DialogInfo({this.title, this.content});
}
