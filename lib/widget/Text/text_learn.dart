import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TextRoute(),
    );
  }
}
/*
  const Text(
    String this.data, {
    Key? key,
    this.style,
    this.strutStyle,
    this.textAlign,文字对齐
    this.textDirection,文字方向
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  })
*/

/*文字对齐
  enum TextAlign {
  left,
  right,
  center,
  // Stretch lines of text that end with a soft line break to fill the width of the container.
  // Lines that end with hard line breaks are aligned towards the [start] edge.
  justify,//看描述应该是拉伸文本到充满宽度，待测
  start,
  end,
}
*/

/*截断方式
enum TextOverflow {
  /// Clip the overflowing text to fix its container.
  clip,
  /// Fade the overflowing text to transparent.
  fade,
  /// Use an ellipsis to indicate that the text has overflowed.
  ellipsis,
  /// Render overflowing text outside of its container.
  visible,
}
 */

/*文本风格， 制定颜色，字体，粗细，文字大小，背景
  const TextStyle({
    this.inherit = true,
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.leadingDistribution,
    this.locale,
    this.foreground,
    this.background,
    this.shadows,
    this.fontFeatures,
    this.decoration,//装饰
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.debugLabel,
    String? fontFamily,//字体
    List<String>? fontFamilyFallback,
    String? package,
    this.overflow,
  })

 */
/*文本装饰
  class TextDecoration {
  //默认啥也没有
  static const TextDecoration none = TextDecoration._(0x0);
  //下划线
  static const TextDecoration underline = TextDecoration._(0x1);
  //上划线
  static const TextDecoration overline = TextDecoration._(0x2);
  //删除线，文字中间
  static const TextDecoration lineThrough = TextDecoration._(0x4);
  }
 */
class TextRoute extends StatelessWidget {
  var widgetList = <Widget>[];
  Text text1 = Text('I\'m potter 123123123123');
  Text text2 = Text(
    'I\'m potter 123123123123',
    textAlign: TextAlign.center,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Learn'),
      ),
      body: Column(
        //用这种方法可以统一文本风格，不过不如把不同的TextStyle作为实例提出来
        children: <Widget>[
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.cyanAccent,
              fontSize: 40,
            ),
            child: Column(
              children: <Widget>[
                Text('Hello1'),
                Text('Helllo2'),
                Text(
                  'Hello3',
                  style: TextStyle(
                    inherit: false,//不继承默认样式
                  ),
                )
              ],
            ),
          ),
          Text('Hello world'),
          Text(
            'Hello world',
            textAlign: TextAlign.center,
          ),
          Text(
            'Hello world' * 10, //字符串重复n次
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Hello world',
            textScaleFactor: 2,
          ),
          Text(
            'Hello world',
            style: TextStyle(
                color: Colors.red,
                fontSize: 25,
                background: Paint()..color = Colors.yellow,
                decoration: TextDecoration.lineThrough,
                decorationStyle: TextDecorationStyle.dashed),
          ),
          //组合效果还是和Android一样，使用span,注意这是命名构造方法
          Text.rich(TextSpan(children: [
            TextSpan(text: 'Hello'),
            TextSpan(
                text: 'World',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.blue,
                ))
          ]))
        ],
      ),
    );
  }
}
