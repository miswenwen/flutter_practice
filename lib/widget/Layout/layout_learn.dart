import 'package:flutter/material.dart';

/*
mixin Diagnosticable
abstract class DiagnosticableTree with Diagnosticable
abstract class Widget extends DiagnosticableTree
abstract class RenderObjectWidget extends Widget
class Flex extends MultiChildRenderObjectWidget
class Column extends Flex
class Row extends Flex


LeafRenderObjectWidget:非容器,Image之类的Widget
SingleChildRenderObjectWidget:包含一个子Widget,有child属性
MultiChildRenderObjectWidget:包含多个Widget,类似ViewGroup，有children属性

约束类
abstract class Constraints
class BoxConstraints extends Constraints

abstract class RenderObjectWidget extends Widget
abstract class SingleChildRenderObjectWidget extends RenderObjectWidget
class ConstrainedBox extends SingleChildRenderObjectWidget

class SizedBox extends SingleChildRenderObjectWidget

abstract class StatelessWidget extends Widget
class UnconstrainedBox extends StatelessWidget

class AspectRatio extends SingleChildRenderObjectWidget


class Container extends StatelessWidget 它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器

abstract class OffsetBase
class Size extends OffsetBase

class Padding extends SingleChildRenderObjectWidget

如果我现在需要一个dp或一个px高的分隔线，用哪个widget？
 */

class LayoutRoute extends StatefulWidget {
  @override
  State<LayoutRoute> createState() {
    return LayoutState();
  }
}

class LayoutState extends State<LayoutRoute> {
  late BoxConstraints boxConstraints;
  late ConstrainedBox constrainedBox;
  late SizedBox sizedBox;
  late UnconstrainedBox unconstrainedBox;
  late AspectRatio aspectRatio; //纵横比
  late LimitedBox limitedBox;
  late FractionallySizedBox fractionallySizedBox; //[ˈfrækʃənəli]很小

  late Container container;
  late Size box;
  late Padding padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Learn'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
            ),
          )
        ],
      ),
    );
  }
}
