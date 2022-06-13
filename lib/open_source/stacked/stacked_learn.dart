import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

///ViewModel应该继承ChangeNotifier/BaseViewModel
///单个的Widget应该继承ViewModelWidget<T extends ChangeNotifier> or ViewModelBuidlerWidget
///ViewModelBuilder.reactive/nonReactive返回的是一个StatefulState
void main() {
  runApp(Body());
}

///BaseViewModel继承于ChangeNotifier，是它的扩展。内部维护了_busyStates还有_initialised。BaseViewModel讲道理会更好用。
///BaseViewModel里面还维护了一个_errorStates，后续需要用上再说吧，当前的项目没这个需求。
ChangeNotifier? changeNotifier;
BaseViewModel? baseViewModel;

///
ViewModelBuilder? viewModelBuilder;

///一般用ViewModelWidget，可以通过重写构造方法设置reactive的值，保证是否刷新(notifyListeners()的时候)
///其实可以整个项目里所有的Widget都继承于ViewModelWidget，静态的reactive就给false，动态的就给true
ViewModelWidget? viewModelWidget;
ViewModelBuilderWidget? viewModelBuilderWidget;

ReactiveServiceMixin? reactiveServiceMixin;
ReactiveViewModel? reactiveViewModel;
StreamViewModel? streamViewModel;
MultipleStreamViewModel? multipleStreamViewModel;
FutureViewModel? futureViewModel;
MultipleFutureViewModel? multipleFutureViewModel;
IndexTrackingViewModel? indexTrackingViewModel;

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
