import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VisitorLineChart extends StatelessWidget {
  VisitorLineChart({Key? key}) : super(key: key);

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
      color: Color(0xFF999999),
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '08:00';
        break;
      case 1:
        text = '08:10';
        break;
      case 2:
        text = '08:20';
        break;
      case 3:
        text = '08:30';
        break;
      case 4:
        text = '08:40';
        break;
      case 5:
        text = '09:00';
        break;
      case 6:
        text = '09:10';
        break;
      case 7:
        text = '09:20';
        break;
      case 8:
        text = '09:30';
        break;
      case 9:
        text = '09:40';
        break;
      case 10:
        text = '09:50';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      //axisSide: AxisSide.top,
      space: 10,
      angle: -45 * pi / 180, //这个转换公式也是没谁了,这个旋转对应的点貌似是组件的左测点，而不是中心点，这就导致旋转后的位置中心对不起，得微调
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
      color: Color(0xFF999999),
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 1:
        text = '10';
        break;
      case 2:
        text = '20';
        break;
      case 3:
        text = '30';
        break;
      case 4:
        text = '40';
        break;
      case 5:
        text = '50';
        break;
      default:
        return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: false),
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 2.8),
                  FlSpot(1, 2.2),
                  FlSpot(2, 1.4),
                  FlSpot(3, 1.6),
                  FlSpot(4, 2.8),
                  FlSpot(5, 3.4),
                  FlSpot(6, 2.8),
                  FlSpot(7, 2.9),
                  FlSpot(8, 2.85),
                  FlSpot(9, 3.5),
                  FlSpot(10, 3.2),
                ],
                isCurved: false,
                //折线or平滑成曲线
                barWidth: 2,
                color: const Color(0xFF3097FB),
                dotData: FlDotData(
                    show: true,
                    getDotPainter: (FlSpot spot, double xPercentage, LineChartBarData bar, int index, {double? size}) {
                      return FlDotCirclePainter(
                        radius: 3,
                        color: index == 5 ? Color(0xFF3097FB) : Colors.white,
                        strokeColor: const Color(0xFFA1CAFF),
                        strokeWidth: 2,
                      );
                    }),
                belowBarData: BarAreaData(
                  show: true,
                  color: const Color(0x0D3097FB),
                ),
              ),
            ],
            //有必要设置，尤其是max，要不然没有取值到对应值的话，不会显示
            minY: 0,
            maxY: 5,
            //上下左右的边框下，下面的网格线是包不住边框线的，所有边框还得单独添加
            borderData: FlBorderData(
              show: true,
              border: const Border(
                bottom: BorderSide(color: Color(0xFFF0F0F0), width: 1),
                left: BorderSide(color: Colors.transparent),
                right: BorderSide(color: Colors.transparent),
                top: BorderSide(color: Color(0xFFF0F0F0), width: 1),
              ),
            ),
            //上下左右坐标轴
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: leftTitleWidgets,
                  interval: 1,
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            //画行列的线，可以只画行，或者列，都有就是网格
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) => FlLine(
                color: const Color(0xFFF0F0F0),
                strokeWidth: 1,
                // dashArray: [8, 4],//用于画虚线
              ),
              drawVerticalLine: false,
              horizontalInterval: 1,
              checkToShowHorizontalLine: (double value) {
                return true;
              },
            ),
          ),
        ),
      ),
    );
  }
}
