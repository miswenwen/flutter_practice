import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class GridViewBase extends StatefulWidget {
  const GridViewBase({Key? key}) : super(key: key);

  @override
  State<GridViewBase> createState() => _GridViewBaseState();
}

class _GridViewBaseState extends State<GridViewBase> {
  @override
  Widget build(BuildContext context) {
    return gridview1();
  }

  Widget gridview1() {
    List<Widget> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(
        Container(
          color: Colors.yellow,
          child: Center(
            child: Container(
              height: 20,
              width: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
    }
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        children: list,
      ),
    );
  }

  // Widget gridview2() {
  //   return GridView.extent(maxCrossAxisExtent: maxCrossAxisExtent);
  // }
  //
  // Widget gridview3() {
  //   return GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder);
  // }
}
