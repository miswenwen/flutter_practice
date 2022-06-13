import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

///ViewModel应该继承ChangeNotifier/BaseViewModel
///单个的Widget应该继承ViewModelWidget<T extends ChangeNotifier> or ViewModelBuidlerWidget
///ViewModelBuilder.reactive/nonReactive返回的是一个StatefulState
void main() {
  runApp(Body());
}

ViewModelBuilder? viewModelBuilder;

ChangeNotifier? changeNotifier;
BaseViewModel? baseViewModel;

ViewModelWidget? viewModelWidget;
ViewModelBuilderWidget? viewModelBuilderWidget;

ReactiveServiceMixin? reactiveServiceMixin;
ReactiveViewModel? reactiveViewModel;
StreamViewModel? streamViewModel;
MultipleStreamViewModel? multipleStreamViewModel;
FutureViewModel? futureViewModel;
MultipleFutureViewModel? multipleFutureViewModel;
IndexTrackingViewModel? indexTrackingViewModel;

///总结下，
///****ViewModelBuilder
///ViewModelBuilder继承于StatefulWidget
///ViewModelBuilder.reactive：builder里面包的所有view都会刷新一次
///ViewModelBuilder.nonReactive：builder里面包的只有继承于ViewModelWidget且reactive为true的才会刷新

///****ViewModelWidget
///ViewModelWidget的reactive默认为true，可以通过重写构造方法设置为false，会决定viewModel在调用notifyListeners()的时候是否刷新
///疑问：ViewModelWidget的reactive设置false和builder里面普通的Widget有啥区别呢？
///1.只是前者可以直接ViewModel实例，后者要传进去。
///2.ViewModelWidget是继承于Widget，有些Mixin要求是StatefulWidget，所有也要看应用场景。

///****ChangeNotifier
///基类，简单需求，我们的ViewModel类继承它就足够了，复杂的功能自己设计逻辑结合它也能实现。

///****BaseViewModel
///BaseViewModel继承于ChangeNotifier，是它的扩展。内部维护了_busyStates还有_initialised。
///runBusyFuture：不传object就把当前ViewModel的busy设置为true，执行完busy设置为false。如果传了object，就是这个object的busy状态值。
///BaseViewModel里面还维护了一个_errorStates，后续需要用上再说吧，当前的项目没这个需求。

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeViewMultipleWidgets(),
    );
  }
}
// ViewModel in the above code

// View
class HomeViewMultipleWidgets extends StatelessWidget {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Checkbox(
            value: state,
            onChanged: (v) {
              state = !state;
            },
          ),

          ///这里测试reactive 和nonReactive
          ///实测无论对于reactive，它的builder里面包的所有view都会刷新一次
          ///对于nonReactive，它的builder里面包的只有继承于ViewModelWidget的才会刷新
          ///对于两者来说，外面没包住的ui的不会刷新，例如上面的checkbox
          ///整个布局用reactive包起来，但是少调用notifyListeners，因为是全局刷新
          ///然后嵌套一些nonreactive,不同的ViewModelBuilder<XXXModel>.nonReactive去实现局部刷新
          ViewModelBuilder<HomeViewModel>.reactive(
            viewModelBuilder: () => HomeViewModel(),
            onModelReady: (viewModel) => viewModel.initialise(),
            disposeViewModel: false,
            builder: (context, viewModel, _) {
              print('builder');
              return Column(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      viewModel.updateTitle();
                    },
                  ),
                  TitleSection(),
                  DescriptionSection(),
                  Checkbox(
                    value: state,
                    onChanged: (v) {
                      state = !state;
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class TitleSection extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Row(
      children: <Widget>[
        Text(
          'Title',
          style: TextStyle(fontSize: 20),
        ),
        Container(
          child: Text(viewModel.title),
        ),
      ],
    );
  }
}

class DescriptionSection extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Row(
      children: <Widget>[
        Text(
          'Description',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        Container(
          child: Text(viewModel.title),
        ),
      ],
    );
  }
}

// ViewModel
class HomeViewModel extends ChangeNotifier {
  String title = 'default';

  void initialise() {
    print('HomeViewModel initialise');
    title = 'initialised';
    notifyListeners();
  }

  int counter = 0;

  void updateTitle() {
    counter++;
    title = '$counter';
    notifyListeners();
  }
}
