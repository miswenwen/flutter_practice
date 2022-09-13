import 'package:flutter/material.dart';
import 'package:flutter_practice/showcase/home_page_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

/**
 * @author:liuqipeng
 * @description:
 * @date:2022/5/13 9:41
 */
class CustomAppBarSection extends ViewModelWidget<HomePageViewModel> {
  @override
  Widget build(BuildContext context, HomePageViewModel viewModel) {
    return Container(
      height: 44.w,
      width: double.infinity,
      color: Colors.red,
      margin: EdgeInsets.only(top: 24),
    );
  }
}
