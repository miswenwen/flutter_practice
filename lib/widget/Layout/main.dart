import 'package:flutter/material.dart';

class TestRoute extends StatefulWidget {
  @override
  State<TestRoute> createState() {
    return TestState();
  }
}

/*


Container({
  Key? key,
  this.alignment,//child怎么对齐
  this.padding,//赋值EdgeInsets
  this.color,
  this.decoration,//对应android drawable xml的corner，solid，gradient，stroke等效果
  this.foregroundDecoration,
  double? width,
  double? height,
  BoxConstraints? constraints,//约束，minHeight,minWidth等，和width，height注意区分
  this.margin,//赋值EdgeInsets
  this.transform,//平移，缩放，旋转，用到较少
  this.transformAlignment,
  this.child,
  this.clipBehavior = Clip.none,
})

margin和padding都是对应的EdgeInsets
EdgeInsets.all 上下左右全部一个值
EdgeInsets.only 上下左右自由设置
EdgeInsets.symmetric(vertical: 8),//上下各添加8dp [sɪ'metrɪk] 对称的

Column，Row：就是LinearLayout，mainAxisAlignment与crossAxisAlignment等于android:gravity

LeafRenderObjectWidget:默认宽高wrap_content
SingleRenderObjectWidget:默认宽高match_parent
MultiRenderObjectWidget:默认宽高要分情况，如果是Column，Row，主轴的Size是match_parent,纵轴的Size是wrap_content
主轴的Size可以通过mainAxisSize设置，可以设置为MainAxisSize.max(默认值)/MainAxisSize.min(相当于wrap_content)

android:layout_width="wrap_content"
android:layout_height="wrap_content"
 //use this as child
 Wrap(
  children: <Widget>[*your_child*])

android:layout_width="match_parent"
android:layout_height="match_parent"
 //use this as child
Container(
    height: double.infinity,
    width: double.infinity,
    child:*your_child*
)

android:layout_width="wrap_content"
android:layout_height="match_parent"
 //use this as child
Column(
  mainAxisSize: MainAxisSize.max
//如果是填充剩余空间，应该使用Expanded

android:layout_width="match_parent"
android:layout_height="wrap_content"
 //use this as child
Row(
  mainAxisSize: MainAxisSize.max,
or
Container(
  alignment:Alignment.xxx,
)
//如果是填充剩余空间，应该使用Expanded

android:layout_width="wrap_content"
android:layout_height="50dp"
Container(
  height: 50,

android:layout_width="50dp"
android:layout_height="wrap_content"
Container(
  width: 50,


实测Container在没有声明alignment的时候，如果height和width没有赋值，是wrap_content
如果声明了alignment,height依然是wrap_content,width变成match_parent
可以灵活使用

对于Column来说，它的宽永远是wrap_content,高是wrap_content还是match_parent取决于mainAxisSize取值
对于Row来说，它的高永远是wrap_content,宽是wrap_content还是match_parent取决于mainAxisSize取值
实际这么说有点偏颇，因为mainAxisSize这个属性有点恶心，说实话实测下来它只影响Column和Row的alignment的效果
例如一个Container ，100x100,alignment: Alignment.center
一个Column里面包2个10x10的Text，如果mainAxisSize = MainAxisSize.min,那么column是20x20，在正中间，这里没有疑问
如果此时MainAxisSize.max，那么column是20x100吗，其实只是看起来像是，因为此时两个文本只是水平居中，竖直并没有
居中，看起来好像高度变成100了。

但是为什么说看起来像是呢，因为即使此时mainAxisSize取值MainAxisSize.max，我用另一个Container把此时的Column包住，这个Container不声明宽高，
只提供color，结果color的范围只有20x20


当我们想要child填补完剩余空间，应该使用Expanded，这个和android里面的weight = 1等效。
在android的LinearLayout中，我们实现这个需求，可以最后一个View，match_parent或者weight = 1,
在flutter中，
没有方式可以实现上面等效的match_parent
(例如我用Column或者Row包一层，mainAxisSize = MainAxisSize.max也没用，因为此时就算Column或者Row填补完剩余空间了，
children里的child的宽高依然是没变的，因为是children变大了，而不是child变大了)
，只能用等效的Expanded(weight = 1)来进行实现。
注意体会！

wrap和flex区别是前者可以折行，其它基本一致

Positioned和Align的区别：前者可以指定元素的精准偏移，其实也无所谓，因为Align里面包个Container，Container里面加margin和padding可以实现一样的效果
 */
class TestState extends State<TestRoute> {
  late Container container;
  late Column column;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Learn'),
      ),
      body: Container(
        color: Colors.black26,
        width: double.infinity,
        height: double.infinity,
        //alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //默认是center，android默认是start
          mainAxisSize: MainAxisSize.max,
          //取值min和max会影响alignment的效果
          children: <Widget>[
            //Text,宽高自适应，背景色红
            Text(
              'aaa',
              style: TextStyle(
                background: Paint()..color = Colors.red,
              ),
            ),
            //或者包个Container
            Container(
              color: Colors.red,
              child: Text('abc'),
            ),
            //Text，宽自适应，高50dp，背景色黄
            Container(
              color: Colors.yellow,
              height: 50,
              child: Text(
                'bbb',
              ),
            ),
            //Text,宽50dp，高自适应，背景色绿
            Container(
              color: Colors.green,
              width: 50,
              child: Text(
                'bbb',
              ),
            ),
            //Text,宽50dp，高50dp，背景色蓝
            Container(
              width: 50,
              height: 50,
              color: Colors.blue,
              child: Text('aaa'),
            ),
            //5个Text，中心和四个角
            Container(
              color: Colors.black26,
              margin: EdgeInsets.only(left: 30),
              padding: EdgeInsets.all(15),
              width: 100,
              height: 100,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 10,
                      height: 10,
                      color: Colors.red,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 10,
                      height: 10,
                      color: Colors.red,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 10,
                      height: 10,
                      color: Colors.red,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 10,
                      height: 10,
                      color: Colors.red,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 10,
                      height: 10,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            //4个Text，前3个高20，宽match_parent,最后一个高填充剩余高度，相当于对部分机型的适配
            Container(
              height: 150,
              width: 150,
              color: Colors.black45,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.red,
                  ),
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.yellow,
                  ),
                  AspectRatio(
                    aspectRatio: 7.5, //150除以7.5=20
                    child: Container(
                      width: double.infinity,
                      color: Colors.blue,
                    ),
                  ),
                  /*
                  这里我是最想不通的，我们注释掉下面的Expanded，Container的高度竟然只是Text的高度
                  明明Column主轴Size已经给到最大了。
                  只能理解成如果Container设置了高度，那么此时Column高度是Container的高度
                  也就是mainAxisSize只在父容器设置了高度的时候才生效。
                  如果Container没有设置高度，此时的mainAxisSize等于无效，然后由children整体的高度反过来
                  决定Column和Container的高度。那这其实就有点傻逼了
                  比如我想用Container包一个Column实现一个色块去填充满剩余空间的需求，实际是达不到的。
                  只能用Expanded去做。
                   */
                  Container(
                    color: Colors.pink,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[Text('sss')],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
