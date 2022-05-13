// View
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      routes: {
        'a': (context) => HomeView(),
        'b': (context) => HomeViewMultipleWidgets(),
      },
      initialRoute: 'a',
    );
  }
}

//响应式的写法
/*
class ViewModelBuilder<T extends ChangeNotifier> extends StatefulWidget
class ChangeNotifier implements Listenable
 */

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using the reactive constructor gives you the traditional ViewModel
    // binding which will execute the builder again when notifyListeners is called.
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              viewModel.updateTitle();
            },
          ),
          body: Center(
            child: Text(viewModel.title),
          ),
        );
      },
    );
  }
}

//注意这里继承自ChangeNotifier
// ViewModel
class HomeViewModel extends ChangeNotifier {
  String title = 'default';

  void initialise() {
    title = 'initialised';
    notifyListeners(); //重建UI
  }

  int counter = 0;

  void updateTitle() {
    counter++;
    title = '$counter';
    notifyListeners();
  }
}

// ViewModel in the above code，
//nonReactive,我们必须为所有不同的响应式布局提供相同的 ViewModel。

// View
class HomeViewMultipleWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, _) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            viewModel.updateTitle();
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[TitleSection(), DescriptionSection()],
        ),
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
