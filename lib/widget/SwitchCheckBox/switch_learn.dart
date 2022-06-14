import 'package:flutter/material.dart';

class SwitchRoute extends StatefulWidget {
  @override
  State<SwitchRoute> createState() {
    return SwitchState();
  }
}
/*
 const Switch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
    this.thumbColor,
    this.trackColor,
    this.materialTapTargetSize,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.autofocus = false,
  })
  final ValueChanged<bool>? onChanged;
  typedef ValueChanged<T> = void Function(T value);
  onChanged对应要赋值一个参数为value的方法

  setState也是的
  void setState(VoidCallback fn) {
    assert(fn != null);
    ...
  }
  typedef VoidCallback = void Function();
  看源码也知道fn调用完以后才往下走去刷新UI
 */

class SwitchState extends State<SwitchRoute> {
  bool _switchSelected = true;
  bool _checkBoxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchCheckBox Learn'),
      ),
      body: Column(
        children: <Widget>[
          Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
              value: _checkBoxSelected,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  _checkBoxSelected = value!; //这里注意value是bool?，所以要加个！
                });
              })
        ],
      ),
    );
  }
}
