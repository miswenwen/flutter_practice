import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */

class StateBuilderRoute extends StatefulWidget {
  const StateBuilderRoute({Key? key}) : super(key: key);

  @override
  State<StateBuilderRoute> createState() => _StateBuilderRouteState();
}

class _StateBuilderRouteState extends State<StateBuilderRoute> {
  String str = "potter";
  int count = 0;
  bool checkState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                count++;
              },
              child: Text('Increase'),
            ),
            //StatefulBuilder很好用
            StatefulBuilder(builder: (context, setState) {
              return Checkbox(
                value: checkState,
                onChanged: (newValue) {
                  ///这个setState就只刷新StateBuilder里的widget
                  setState(() => checkState = newValue!);
                },
              );
            }),
            Checkbox(
              value: checkState,
              onChanged: (newValue) {
                ///这个setState刷新的就是整个Widget数，包括StatefulBuilder里的widget
                setState(() => checkState = newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
