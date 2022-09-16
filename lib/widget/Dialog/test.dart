import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

///对于对话框来说
///https://material.io/components/dialogs/flutter
///
///对话框标题，内容，按钮都要可以自定义，对话框的背景颜色， 对话框的四个角的半径radius要能改,这些在AlertDialog的属性里都可以定义
///对话框关闭的条件要可控，例如监控物理返回键，虚拟返回键，对话框外部区域的点击等
///barrierDismissible：用来控制点击对话框外部区域是否可以关闭对话框，控制不到返回键 [ˈbæriər]阻碍
///返回键的处理其实有个思路：就是对话框弹出的时候屏蔽掉返回键，对话框关闭的时候再放开，但是控制上得非常小心。因为对话框关闭的途径可能漏。
///
/// AlertDialog：title，content，buttons
/// SimpleDialog:title,ListItem,相比于AlertDialog并没有TextButton,也就是没有确定和取消
class DialogLearn extends StatelessWidget {
  const DialogLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 200),
        TextButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false, // user must tap button!
                barrierLabel: 'ssss',
                builder: (context) {
                  return alertDialog(context);
                },
              );
            },
            child: Text('AlertDialog')),
        TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return simpleDialog(context);
                },
              );
            },
            child: Text('SimpleDialog')),
        TextButton(onPressed: () {}, child: Text('ConfirmationDialog')),
        //全屏的Dialog自己定义即可，并没有内置组件
        TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Scaffold(
                    backgroundColor: Colors.white.withOpacity(0.85),
                    body: Container(),
                  );
                },
              );
            },
            child: Text('FullScreenDialog')),
      ],
    );
  }

  Widget alertDialog(BuildContext context) {
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
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }

  Widget simpleDialog(BuildContext context) {
    return SimpleDialog(
      title: Text('Set backup account'),
      children: [
        SimpleDialogItem(
          icon: Icons.account_circle,
          color: Colors.orange,
          text: 'user01@gmail.com',
          onPressed: () {
            Navigator.pop(context, 'user01@gmail.com');
          },
        ),
        SimpleDialogItem(
          icon: Icons.account_circle,
          color: Colors.green,
          text: 'user02@gmail.com',
          onPressed: () {
            Navigator.pop(context, 'user02@gmail.com');
          },
        ),
        SimpleDialogItem(
          icon: Icons.add_circle,
          color: Colors.grey,
          text: 'Add account',
          onPressed: () {
            Navigator.pop(context, 'user02@gmail.com');
          },
        ),
      ],
    );
  }
}

class SimpleDialogItem extends StatelessWidget {
  const SimpleDialogItem({Key? key, required this.icon, required this.color, required this.text, required this.onPressed}) : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 36.0, color: color),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
