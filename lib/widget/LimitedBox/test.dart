import 'package:flutter/material.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class LimitedBoxLearn extends StatefulWidget {
  const LimitedBoxLearn({Key? key}) : super(key: key);

  @override
  State<LimitedBoxLearn> createState() => _LimitedBoxLearnState();
}

///LimitedBox : A box that limits its size only when it's unconstrained.
///ConstrainedBox, which applies its constraints in all cases, not just when the incoming constraints are unbounded.
///注意区分
class _LimitedBoxLearnState extends State<LimitedBoxLearn> {
  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     LimitedBox(
    //       maxWidth: 100,
    //       child: Text('abcd', maxLines: 1),
    //     ),
    //     Text('---bbbb'),
    //   ],
    // );
    // return Row(
    //   children: [
    //     Container(
    //       constraints: BoxConstraints(
    //         maxWidth: 100,
    //       ),
    //       child: Text('abcd' * 10, maxLines: 1),
    //     ),
    //     Text('---bbbb'),
    //   ],
    // );
    // return Row(
    //   children: [
    //     SizedBox(
    //       height: 100,
    //       child: Text('abcd' * 10, maxLines: 1),
    //     ),
    //     Text('---bbbb'),
    //   ],
    // );
    return Row(
      children: [
        LimitedBox(
          maxWidth: 100,
          child: Text('abcd' * 10, maxLines: 1),
        ),
        Text('---bbbb'),
      ],
    );

    // return Row(
    //   children: [
    //     ConstrainedBox(
    //       constraints: BoxConstraints(maxWidth: 100),
    //       child: Text('abcd' * 10, maxLines: 1),
    //     ),
    //     Text('---bbbb'),
    //   ],
    // );
  }
}
