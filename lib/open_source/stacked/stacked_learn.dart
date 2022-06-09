import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

void main() {
  runApp(Body());
}

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
          ///实测无论对于reactive，它里面包的所有view都会刷新一次
          ///对于nonReactive，它里面包的只有继承于ViewModelWidget的才会刷新
          ///对于两者来说，外面没包住的ui的不会刷新，例如上面的checkbox
          ViewModelBuilder<HomeViewModel>.reactive(
            viewModelBuilder: () => HomeViewModel(),
            onModelReady: (viewModel) => viewModel.initialise(),
            builder: (context, viewModel, _) {
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
