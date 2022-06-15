import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

///开源库flutter_spinkit 提供大量动画
///spin:旋转
class IndicatorRoute extends StatelessWidget {
  const IndicatorRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // 主轴(水平)方向间距
      runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        LinearProgressIndicator(),
        SizedBox(
          height: 50,
        ),

        ///value：取值0~1，用来表示进度，可以用于刷新进度0~100%
        ///color:进度条颜色
        ///bgColor：进度条背景颜色
        ///valueColor:进度条颜色可以搞成动画，暂时没用上的地方
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 200,
            height: 20,
            child: LinearProgressIndicator(
              value: 0.1,
              backgroundColor: Colors.red,
              color: Colors.green,
              minHeight: 10,
              //valueColor: AlwaysStoppedAnimation(Colors.yellow),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),

        ///可以酌情加上backgroundColor，默认貌似是透明的
        CircularProgressIndicator(),
        CircularProgressIndicator(
          value: 0.3,
        ),
        SizedBox(
          height: 50,
          width: 30, //宽高不一致是椭圆
          child: CircularProgressIndicator(
            value: 0.3,
            backgroundColor: Colors.grey,
          ),
        ),

        SpinKitRotatingCircle(
          color: Colors.red,
          size: 50.0,
        ),
        SpinKitRotatingPlain(
          color: Colors.yellow,
        ),
        SpinKitWave(
          color: Colors.blue,
        ),
        SpinKitCircle(
          color: Colors.teal,
        ),
        SpinKitFadingCircle(
          color: Colors.teal,
        ),
        SpinKitThreeBounce(
          color: Colors.teal,
        ),
        SpinKitFadingFour(
          color: Colors.teal,
        ),
        SpinKitCubeGrid(
          color: Colors.teal,
        ),
        SpinKitFadingGrid(
          color: Colors.teal,
        ),
      ],
    );
  }
}
