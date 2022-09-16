import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

///DropdownButton以及DropdownMenuItem的学习参考youtube.com/watch?v=ZzQ_PWrFihg
///DropdownButton这个有点蠢的在于，Menus不是在Button的正下方。而是根据你选中的MenuItem而动态在变化的。试了下，如果选中最后一项，Button又在最上方(把AppBar也拿掉了)，
///Menus倒是不会overflow，顶到屏幕外面去。这点看来不用担心。不过体验还是有点怪怪的。
///Their placement varies based on the element that opens them.官网也是这么描述的
///
/// 我想要的那种效果实际上是Exposed dropdown menus
/// Exposed dropdown menus display the currently selected menu item above the list of options.
/// PopupMenuButton的效果实际是Icon点击后弹出一些选项，最典型的应用是类似AppBar上的Overflow按钮点击弹出多个action，然后跳转
/// 我想要的是类似android的任意组件，点击后，从该组件的附近(尤其是下方)弹出来，类似PopUpWindow
class MenuLearn extends StatefulWidget {
  const MenuLearn({Key? key}) : super(key: key);

  @override
  State<MenuLearn> createState() => _MenuLearnState();
}

class _MenuLearnState extends State<MenuLearn> {
  String _selectedValue = 'AAA';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        dropDownBtn(),
        popupMenuButton(),
        ElevatedButton(
          onPressed: () {},
          child: Text('DropdownMenus'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('ExposedDropdownMenus'),
        ),
      ],
    );
  }

  Widget dropDownBtn() {
    return DropdownButton(
      value: _selectedValue,
      items: const [
        DropdownMenuItem(
          value: 'AAA',
          child: Text('AAA'),
        ),
        DropdownMenuItem(
          value: 'BBB',
          child: Text('BBB'),
        ),
        DropdownMenuItem(
          value: 'CCC',
          child: Text('CCC'),
        ),
        DropdownMenuItem(
          value: 'DDD',
          child: Text('DDD'),
        ),
      ],
      onChanged: (String? selectedValue) {
        setState(() {
          _selectedValue = selectedValue!;
        });
      },
    );
  }

  Widget popupMenuButton() {
    return PopupMenuButton(
      ///这里icon一般还是放的图标，如果不设置是默认的overflow也就是竖着3个点
      ///当然，用文字也可以，因为类型是Widget，但肯定和设计初衷不符合
      //icon: Icon(Icons.access_alarm),
      icon: Text('aaa'),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 'AAA',
            child: Text('AAA'),
          ),
          PopupMenuItem(
            value: 'BBB',
            child: Text('BBB'),
          ),
          PopupMenuItem(
            value: 'CCC',
            child: Text('CCC'),
          ),
          PopupMenuItem(
            value: 'DDD',
            child: Text('DDD'),
          ),
        ];
      },
    );
  }
}
