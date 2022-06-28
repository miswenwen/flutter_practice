import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class PartItem extends StatefulWidget {
  final Color color;
  final double height;
  const PartItem(this.color, {this.height = 500.0, Key? key}) : super(key: key);

  @override
  State<PartItem> createState() => _PartItemState();
}

class _PartItemState extends State<PartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: widget.color,
    );
  }
}
