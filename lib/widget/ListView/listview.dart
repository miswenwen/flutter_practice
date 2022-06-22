import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

///常见需求：
///ListView填满剩余控件 done
///ListView固定若干个Item高度  done
///ListView加分隔线
///ListView分Type加载
///ListViewItem里的Checkbox，progressbar状态维护
///ListView数据按块加载
///ListView上拉，下拉刷新

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('1111111'),
          listWithDivider2(),
        ],
      ),
    );
  }

  ///ListView填满剩余控件
  Widget expandListview() {
    List<Widget> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(Text('sss $i'));
    }
    return Expanded(
      child: ListView(
        children: list,
      ),
    );
  }

  ///ListView固定若干个Item高度,利用itemExtent和shrinwrap，注意有overScroll效果,常用
  ///注意这里shrinwrap是要配合用的，因为我们毕竟设置的是item高度嘛
  Widget unchangedItemHeightList1() {
    return Container(
      //color: Colors.blue,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Center(
            child: Text('zzz $index'),
          );
        },
        itemCount: 3,
        itemExtent: 50,
      ),
    );
  }

  ///ListView固定若干个Item高度,利用shrinkWrap = true，常用
  ///shrinkwrap，以该例来说，shrinkWrap = true,container的高度就可以不用设置
  ///shrinkwrap默认值是false，意思就是用item的高度来生成listview的高度
  Widget unchangedItemHeightList2() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          child: Text('zzz $index'),
        );
      },
      itemCount: 3,
    );
  }

  ///ListView固定若干个Item高度,自己计算容器高度，不常用，太笨
  ///shrinkwrap如果为false，container的高度就必须要设置，要不然报错
  Widget unchangedItemHeightList3() {
    return Container(
      height: 3 * 60,
      color: Colors.blue,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            color: Colors.cyanAccent,
            height: 50,
            child: Text('zzz $index'),
          );
        },
        itemCount: 3,
      ),
    );
  }

  ///ListView加分隔线,item的底部加一条线
  Widget listWithDivider1() {
    return ListView.builder(
      itemCount: 3,
      itemExtent: 50,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Center(
              child: Text('aaa $index'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.yellow,
              ),
            )
          ],
        );
      },
    );
  }

  ///ListView加分隔线,使用ListView.separated来做的，不太推荐
  ///但是最后一个item的后面是没有分隔线的。得去外面加，或者itemBuilder里面判断index是最后一个，加个分隔线。
  ///这里就没有itemExtent这个属性了。shrinkWrap依然可以用。
  Widget listWithDivider2() {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          child: Center(
            child: Text('aaa $index'),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 1,
          thickness: 1,
          color: Colors.yellow,
        );
      },
    );
  }
}
