import 'package:flutter/material.dart';

class SpacerLearn extends StatelessWidget {
  const SpacerLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'dataaaaaa' * 20,
          softWrap: false,
        ),
        Spacer(),
        Text('22221111'),
      ],
    );
  }
}
