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
  //自评估和工信部都要求，权限在调用的地方进行申请，而不是在进应用的时候一次性申请，故权限都是单个申请的。

  //对于permission_controller, request()，给权限status==>granted,第一次不给权限status==>denied,第二次不给权限status==>permanentalDenied
  //对于我们的业务逻辑，考虑要在申请权限弹框之前还要加个权限说明弹框，告诉申请权限是干嘛的
  static Future<void> request(BuildContext context, Permission permission) async {
    Log.e(await permission.status, tag: 'potter1111');
    if (await permission.status.isGranted) {
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
            PermissionStatus status = await permission.request();
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
    /*
      好几种选择
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
