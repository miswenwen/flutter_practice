import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../home_page_view_model.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class CommonTilesSection extends ViewModelWidget<HomePageViewModel> {
  @override
  Widget build(BuildContext context, HomePageViewModel viewModel) {
    List<CommonTile> tiles = [];
    for (CommonTileItem item in viewModel.commonTileList) {
      tiles.add(CommonTile(commonTileItem: item));
    }
    return Container(
      //color: Colors.red,
      //margin: EdgeInsets.only(top: 16),
      child: GridView.count(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        childAspectRatio: 1 / 1.1,
        children: tiles,
      ),
    );
  }
}

class CommonTile extends StatelessWidget {
  final CommonTileItem commonTileItem;

  const CommonTile({Key? key, required this.commonTileItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //color: Colors.yellow,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            commonTileItem.tileIcon,
            width: 55.w,
            height: 55.w,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 5.w),
          Text(
            commonTileItem.tileName,
            style: TextStyle(color: Colors.black, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}

class CommonTileItem {
  final String tileIcon;
  final String tileName;

  CommonTileItem(this.tileIcon, this.tileName);
}
