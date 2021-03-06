import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
///每次加载20个，下拉的时候再加载20个，加载到100个就不刷新了
///等于是个无限加载功能,无限上拉加载
class ListInfinite extends StatefulWidget {
  const ListInfinite({Key? key}) : super(key: key);

  @override
  State<ListInfinite> createState() => _ListInfiniteState();
}

///实测每次setState后，listview区域里显示的index是上一次的，为什么能记忆住index呢？有点神奇，可能是Listview里面自己维护了index的值吧。
///毕竟setState只是重新createState而已。
class _ListInfiniteState extends State<ListInfinite> {
  List<String> list = <String>['end']; //list先只放一个元素，标记为表尾
  List<String> data = <String>['a', 'b', 'c'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          ///每到表尾就去加载20个数据，再build一次
          if (list[index] == 'end') {
            if (list.length < 15) {
              insertData(index);
              return Center(
                child: Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(16.0),
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Text('没有更多了');
            }
          }
          return Container(
            height: 50,
            child: Text(list[index]),
          );
        },
        itemCount: list.length,
      ),
    );
  }

  Future insertData(int index) {
    return Future.delayed(
      Duration(seconds: 3),
    ).then(
      (value) {
        setState(() {
          List<String> data = <String>['a $index', 'b ${index + 1}', 'c ${index + 2}'];
          list.insertAll(list.length - 1, data);
        });
      },
    );
  }
}
