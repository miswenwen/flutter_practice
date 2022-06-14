import 'package:flutter/material.dart';

class UIRoute extends StatefulWidget {
  const UIRoute({Key? key}) : super(key: key);

  @override
  State<UIRoute> createState() => _UIRouteState();
}

class _UIRouteState extends State<UIRoute> with SingleTickerProviderStateMixin {
  //  _UIRouteState(){
  //   initWidgets();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn'),
        bottom: new TabBar(
          indicatorColor: Colors.greenAccent,
          isScrollable: true,
          tabs: _tabItems,
          controller: _tabController,
          onTap: (index) {
            _pageController?.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.linear);
          },
        ),
      ),
      body: _pageView,
      bottomNavigationBar: new Material(
        color: Colors.red,
        child: new TabBar(
          tabs: _tabItems,
          controller: _tabController,
          onTap: (index) {
            _pageController?.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.linear);
          },
        ),
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
    //hot reload会走这
    //initWidgets();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('setState');
  }

  @override
  void didUpdateWidget(UIRoute oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void activate() {
    super.activate();
    print('activate');
  }

  @override
  void initState() {
    super.initState();
    print('initState');
    initWidgets();
  }

  Card? _card;
  PageView? _pageView;
  late List<Widget> _tabItems;
  PageController? _pageController;
  TabController? _tabController;
  int _initIndex = 1;

  void initWidgets() {
    tabPageLearn();
    others();
  }

  void tabPageLearn() {
    _tabItems = <Widget>[
      Icon(Icons.access_alarm),
      Icon(Icons.home),
      Icon(Icons.schedule),
    ];
    _pageController = PageController(initialPage: _initIndex);
    _pageView = PageView(
      controller: _pageController,
      children: <Widget>[
        Icon(Icons.access_alarm),
        Icon(Icons.home),
        Icon(Icons.schedule),
      ],
      onPageChanged: (index) {
        _tabController?.animateTo(index);
      },
    );
    _tabController = TabController(length: _tabItems.length, vsync: this, initialIndex: _initIndex);
  }

  void others() {
    _card = Card(
      child: Container(
        width: 500,
        height: 200,
        // child: ElevatedButton(
        //   onPressed: () {},
        //   child: Text('Test'),
        // ),
      ),
    );
  }
}
