import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../log.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class PermissionUtils {
  //应用第一次安装，权限status默认是denied
  //request()，给权限status==>granted,不给权限status==>permanentalDenied
  //对于我们的业务逻辑，考虑要在申请权限弹框之前还要加个权限说明弹框，告诉申请权限是干嘛的
  static Future<void> request(BuildContext context, Permission permission) async {
    Log.e(await permission.status, tag: 'potter1111');
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      barrierLabel: 'ssss',
      builder: (context) {
        return alertDialog(context, permission);
      },
    );
    // if (await permission.status.isGranted) {
    //   //do nothing
    // } else if (await permission.status.isDenied) {
    //   showDialog(
    //     context: context,
    //     barrierDismissible: false, // user must tap button!
    //     barrierLabel: 'ssss',
    //     builder: (context) {
    //       return alertDialog(context, permission);
    //     },
    //   );
    // } else if (await permission.status.isPermanentlyDenied) {
    //   openAppSettings();
    // }
  }

  static Widget alertDialog(BuildContext context, Permission permission) {
    return AlertDialog(
      title: Text('AlertDialogTest'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('This is a demo alert dialog.'),
            Text('Would you like to approve of this message?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            PermissionStatus status = await permission.request();
            Log.e(status, tag: 'potter2222');
            Navigator.pop(context, 'OK');
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
