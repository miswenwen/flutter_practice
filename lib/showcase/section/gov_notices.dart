import 'package:flutter/material.dart';
import 'package:flutter_practice/showcase/item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../home_page_view_model.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class GovNoticesSection extends ViewModelWidget<HomePageViewModel> {
  @override
  Widget build(BuildContext context, HomePageViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(top: 18.w),
      child: Column(
        children: [
          titleArea(),
          listArea(viewModel, context),
        ],
      ),
    );
  }

  Widget titleArea() {
    return Container(
      height: 45.w,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '政策通知',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '更多内容',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF969696),
                  ),
                ),
                SizedBox(width: 6.w),
                Image.asset(
                  'assets/images/home/right_arrow.png',
                  width: 4.5.w,
                  height: 9.5.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listArea(HomePageViewModel viewModel, BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListViewTile(viewModel.newsList[index]),
              const Divider(
                height: 1,
                color: Color(0x1F000000),
              )
            ],
          );
        },
        shrinkWrap: true,
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class ListViewTile extends StatelessWidget {
  NewsItem newsItem;

  ListViewTile(this.newsItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.w,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 13.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          thumbnail(newsItem.thumbnails),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 13.w),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        title(newsItem.title),
                        SizedBox(height: 3.w),
                        content(newsItem.content),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: dateTime(newsItem.dateTime),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget thumbnail(String thumbnail) {
    return Container(
      width: 102.w,
      height: 80.w,
      decoration: BoxDecoration(color: const Color(0xAFD3E7FF), borderRadius: BorderRadius.circular(4)),
      child: Image.asset(
        thumbnail,
      ),
    );
  }

  Widget title(String title) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget content(String content) {
    return Text(
      content,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: const Color(0xFFA4A7B6),
        fontSize: 12.sp,
      ),
    );
  }

  Widget dateTime(String dateTime) {
    return Text(
      dateTime,
      style: TextStyle(
        color: const Color(0xFFA4A7B6),
        fontSize: 12.sp,
      ),
    );
  }
}
