import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ImageRoute(),
    );
  }
}

/*
drawable-ldpi 对应DPI为120       1dp=0.75px
drawable-mdpi 对应DPI为160     1dp=1.0px
drawable-hdpi 对应DPI为240	      1dp=1.5px
drawable-xhdpi 对应DPI为320     1dp=2.0px
drawable-xxhdpi 对应DPI为480   1dp=3.0px
我的OPPO K3
 wm size：Physical size: 1080x2340
 wm density：Physical density: 480
 1dp对应3px，所以宽最大是1080/3=360dp
 */

/*
  const Image({
    Key? key,
    required this.image,
    this.frameBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.width,//宽，单位dp
    this.height,//高，单位dp
    this.color,
    this.opacity,
    this.colorBlendMode,//混合模式，和android的PorterDuffXfermode类似,color和colorBlendMode配合使用
    this.fit,//缩放模式,对应BoxFit对象,对应android:scaleType
    this.alignment = Alignment.center,//对齐方式
    this.repeat = ImageRepeat.noRepeat,//重复方式
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.filterQuality = FilterQuality.low,
  })
 */
/*
enum BoxFit {
  fill,
  contain,
  cover,
  fitWidth,
  fitHeight,
  none,
  scaleDown,
}

 */
class ImageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Learn'),
      ),
      body: Column(
        children: <Widget>[
          Image(
            image: AssetImage('images/one_piece.png'),
            width: 360, //这里的单位实测是dp，故360就能铺满宽度
          ),
          //命名构造方法和上面的等效
          Image.asset(
            'images/one_piece.png',
            width: 100,
          ),
          //不支持xml和svg的矢量图，只支持字体图标，也就是Icons.xxx,要使用svg的话，得用非官方的flutter_svg包
          Image.asset(
            'images/access_alarms.xml',
            width: 100,
            height: 100,
          ),
          //这也太方便了
          Image(
            image: NetworkImage(
                'https://img2.baidu.com/it/u=1814268193,3619863984&fm=253&fmt=auto&app=138&f=JPEG?w=632&h=500'),
            width: 200,
          ),
          //命名构造方法和上面的等效
          Image.network(
            'https://img2.baidu.com/it/u=1814268193,3619863984&fm=253&fmt=auto&app=138&f=JPEG?w=632&h=500',
            width: 100,
          ),
        ],
      ),
    );
  }
}
