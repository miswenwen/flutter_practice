/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
import 'package:flutter/material.dart';
import 'package:flutter_practice/log.dart';
import 'package:flutter_practice/widget/ListView/part.dart';

///
/// 按照需求，Column，包当前应用和全部应用
///全部应用，包Toolbar和MainArea
///MainArea是个ScrollView，用Listview也行，包的是N个part
///单个part = title + 可拖拽的gridview

class ArchorTest extends StatefulWidget {
  const ArchorTest({Key? key}) : super(key: key);

  @override
  State<ArchorTest> createState() => _ArchorTestState();
}

class _ArchorTestState extends State<ArchorTest> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        currentApps(),
        allApps(),
      ],
    );
  }

  Widget currentApps() {
    return Container(
      height: 100,
      color: Colors.cyanAccent,
    );
  }

  Widget allApps() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          toolBar(),
          mainArea(),
        ],
      ),
    );
  }

  Widget toolBar() {
    return TabBar(
      indicatorColor: Colors.black,
      isScrollable: true,
      tabs: _tabItems,
      controller: _tabController,
      onTap: (index) async {
        Log.e('index  $index', tag: 'potterliu');
        _enableScrollListener = false;
        await _scrollController.animateTo(startPointforParts[index]!, duration: Duration(milliseconds: 500), curve: Curves.linear);
        _lastIndex = index;
        _enableScrollListener = true;
      },
    );
  }

  Widget mainArea() {
    ///这里必须一次性加载进来，如果用Listview那种带有缓存的加载，后面的part拿不到高度
    return Expanded(
        child: SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: _partItems,
      ),
    ));

    ///下面这种写法不行
    // return Expanded(
    //   child: ListView.builder(
    //     shrinkWrap: true,
    //     controller: _scrollController,
    //     itemBuilder: (context, index) {
    //       return _partItems[index];
    //     },
    //     itemCount: _partItems.length,
    //   ),
    // );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
    _scrollController.dispose();
  }

  late List<Widget> _tabItems = [];
  late List<PartItem> _partItems = [];

  ///每次都计算出每个part的锚点位置，startPoint0是0，第以是是startPoint0+part0.height，
  ///第二是startPoint1+part1.height，第三是startPoint2+part2.height,以此类推
  ///有N个part，就有N+1个锚点，算上首尾两个
  late List<double?> startPointforParts = [];

  ///每个part的高度
  late List<double?> heightOfParts = [];

  ///上一次的滑动坐标，和当前的滑动坐标一起判断tab跳转哪个
  double _lastScrollPoint = .0;

  TabController? _tabController;
  ScrollController _scrollController = ScrollController();
  int _initIndex = 0;

  ///记录上一次的toolbar的index，防止多次跳当前页
  int _lastIndex = -1;

  ///我们点击tab的时候，置为false。免得冲突
  bool _enableScrollListener = true;

  GlobalKey part1key = GlobalKey();
  GlobalKey part2key = GlobalKey();
  GlobalKey part3key = GlobalKey();
  void init() {
    _tabItems.add(Text('aaa', style: TextStyle(fontSize: 20, color: Colors.cyan)));
    _tabItems.add(Text('bbb', style: TextStyle(fontSize: 20, color: Colors.cyan)));
    _tabItems.add(Text('ccc', style: TextStyle(fontSize: 20, color: Colors.cyan)));

    PartItem partItem1 = PartItem(Colors.red, key: part1key, height: 1000);
    PartItem partItem2 = PartItem(Colors.green, key: part2key, height: 2000);
    PartItem partItem3 = PartItem(Colors.yellow, key: part3key, height: 800);
    _partItems.add(partItem1);
    _partItems.add(partItem2);
    _partItems.add(partItem3);

    ///这里要用future，保证build结束后再去拿高度，要不然还没build，拿不到的。
    Future(() {
      Log.d('height', tag: 'potterliu');
      Log.e(part1key.currentContext?.size?.height, tag: 'potterliu');
      Log.e(part2key.currentContext?.size?.height, tag: 'potterliu');
      Log.e(part3key.currentContext?.size?.height, tag: 'potterliu');
      heightOfParts.add(part1key.currentContext?.size?.height);
      heightOfParts.add(part2key.currentContext?.size?.height);
      heightOfParts.add(part3key.currentContext?.size?.height);

      double? currentStart = 0;
      startPointforParts.add(currentStart);
      currentStart = currentStart + heightOfParts[0]!;
      startPointforParts.add(currentStart);
      currentStart = currentStart + heightOfParts[1]!;
      startPointforParts.add(currentStart);
      currentStart = currentStart + heightOfParts[2]!;
      startPointforParts.add(currentStart);
    });

    _tabController = TabController(length: _tabItems.length, vsync: this, initialIndex: _initIndex);

    _scrollController.addListener(() {
      if (!_enableScrollListener) return;

      ///注意这里的i取值是1.
      for (int i = 1; i < startPointforParts.length; i++) {
        Log.e('_scrollController.offset ${_scrollController.offset}', tag: 'potterliu');
        Log.e('startPointforParts[i] $i   ${startPointforParts[i]}', tag: 'potterliu');
        if (_scrollController.offset > startPointforParts[i - 1]! && _scrollController.offset < startPointforParts[i]!) {
          if (_lastIndex == i - 1) {
            return;
          }
          Log.e('changeTab', tag: 'potterliu');
          _tabController?.animateTo(i - 1);
          _lastIndex = i - 1;
          return;
        }

        ///这种算法弃用了。
        ///这里实现滑动时，tabbar能够动态变；如果慢慢滑，没有问题，但是滑动的非常快。前后两个点就不满足gap这个条件了。
        // double currentGap = _scrollController.offset - startPointforParts[i]!;
        // double lastGap = _lastScrollPoint - startPointforParts[i]!;
        // Log.e('currentGap $currentGap', tag: 'potterliu');
        // Log.e('lastGap $lastGap', tag: 'potterliu');
        //
        // if (currentGap > 0 && currentGap < gap && lastGap > -gap && lastGap < 0) {
        //   Log.e('zzzzzzzzzzzzzzzzzz111111111', tag: 'potterliu');
        //   _tabController?.animateTo(i);
        // }
        // if (lastGap > 0 && lastGap < gap && currentGap > -gap && currentGap < 0) {
        //   Log.e('zzzzzzzzzzzzzzzzzz22222222222', tag: 'potterliu');
        //   _tabController?.animateTo(i - 1);
        // }
      }
      _lastScrollPoint = _scrollController.offset;
    });
  }
}
