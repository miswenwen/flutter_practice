import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../home_page_view_model.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class ServiceTilesSection extends ViewModelWidget<HomePageViewModel> {
  @override
  Widget build(BuildContext context, HomePageViewModel viewModel) {
    List<ServiceTile> tiles = [];
    for (ServiceTileItem item in viewModel.serviceList) {
      tiles.add(ServiceTile(serviceTileItem: item));
    }
    return Container(
      //color: Colors.red,
      //margin: EdgeInsets.only(top: 16),
      child: GridView.count(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        //mainAxisSpacing: 8,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        //childAspectRatio: aspectRadio,
        children: tiles,
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final ServiceTileItem serviceTileItem;

  const ServiceTile({Key? key, required this.serviceTileItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //color: Colors.yellow,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 35.w,
            height: 35.w,
            alignment: Alignment.center,
            //部分svg资源解析不出来，改用Image
            // child: SvgPicture.asset(
            //   serviceTileItem.svgPic,
            //   width: 30.w,
            //   fit: BoxFit.fitWidth,
            // ),
            child: Image.asset(
              serviceTileItem.serviceIcon,
              width: 30.w,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 10.w),
          Text(
            serviceTileItem.serviceName,
            style: TextStyle(color: Colors.black, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}

class ServiceTileItem {
  final String serviceIcon;
  final String serviceName;

  ServiceTileItem(this.serviceIcon, this.serviceName);
}
