import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

///常见需求：
///ListView填满剩余控件
///ListView固定若干个Item高度
///ListView加分隔线
///ListView分Type加载
///ListViewItem里的Checkbox，progressbar状态维护
///ListView数据按块加载
///ListView上拉，下拉刷新
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: ListViewLearn(),
    );
  }
}

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Text('zzz');
          },
          itemCount: 3,
          itemExtent: 50,
        ),
      ),
    );
  }
}
