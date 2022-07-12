import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/widget/GridView/selectable_item.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class DraggableGridviewTest extends StatefulWidget {
  const DraggableGridviewTest({Key? key}) : super(key: key);

  @override
  State<DraggableGridviewTest> createState() => _DraggableGridviewTestState();
}

class _DraggableGridviewTestState extends State<DraggableGridviewTest> {
  final controller = DragSelectGridViewController();
  @override
  void initState() {
    super.initState();
    controller.addListener(scheduleRebuild);
  }

  @override
  void dispose() {
    controller.removeListener(scheduleRebuild);
    super.dispose();
  }

  void scheduleRebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return DragSelectGridView(
      gridController: controller,
      itemCount: 20,
      itemBuilder: (context, index, selected) {
        return SelectableItem(
          index: index,
          selected: selected,
          color: Colors.green,
        );
      },
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 80,
      ),
    );
  }
}
