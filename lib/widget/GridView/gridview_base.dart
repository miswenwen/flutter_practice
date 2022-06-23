import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

///总结
///GridView.count和GridView.extent常用
///如果想要不滑动要配合shrinkWrap = true来用，在外面包container计算height我试过总是有点误差，应该是里面有些padding，margin没干掉的。
///count就是指的每行多少个。
///extent就是单个item宽度最大多少。例如设置120，在宽300的手机，单行就是3个(300/2= 150,300/3= 100,)。在宽640的手机，单行就是5个(640/5= 128,640/6= 106.xx)

///其实extent会更合理，但是一般不符合ui的设计
///用count的话，有可能会存在Gridview的高宽计算出来导致item放不下了。这时候只能搞个缩放因子。
///item里的所有控件宽高，还有margin，padding乘以这个缩放因子
///
///
/*
Log.e('window ${window.physicalSize}', tag: 'potter'); //对应的是px，需要转化为dp
Log.e('window ${window.devicePixelRatio}', tag: 'potter');
double aspectRadio = 85.75 / 88;// 这里是item的宽高比
double calHeight = (window.physicalSize.width / window.devicePixelRatio - 16 * 2) / 4 * (aspectRadio);//这里的4是一行4个，还有左右的padding是16
double widgetRadio = calHeight / 88 > 0.85 ? 1 : calHeight / 88; //tile的缩放系数，有的手机非常窄，这样计算的高度不足够容纳图片+文字,大概72dp
Log.e('calHeight $calHeight  widgetRadio $widgetRadio', tag: 'potter');
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

  Widget gridview2() {
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
    return GridView.extent(
      maxCrossAxisExtent: 120,
      children: list,
      shrinkWrap: true,
    );
  }
  //
  // Widget gridview3() {
  //   return GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder);
  // }
}
