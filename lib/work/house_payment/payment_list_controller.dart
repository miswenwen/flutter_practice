import 'dart:io';

import 'package:get/get.dart';

//单个房屋的各项费用
class PaymentListController extends GetxController {
  //欠费总计，网络请求拿，因为列表项都是分块加载的，所以自己算不了，得后台算好，我们取
  var totalExpense;

  //费用集合
  List<ExpenseInfo> expenseList = [];

  @override
  void onInit() {
    super.onInit();
    prepareDefaultData();
  }

  @override
  void onReady() async {
    super.onReady();
    await loadRes();
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void prepareDefaultData() {
    totalExpense = '5750.72';
    expenseList.clear();
    expenseList.add(ExpenseInfo(title: 'aaa', subTitle: 'bbb', fee: '2875.36'));
    expenseList.add(ExpenseInfo(title: 'ccc', subTitle: 'ddd', fee: '2875.36'));
  }

  //网络请求拿数据
  Future loadRes() {
    return Future(() {
      sleep(Duration(seconds: 5));
      expenseList.add(ExpenseInfo(title: 'eee', subTitle: 'fff', fee: '2875.36'));
    });
  }
}

class ExpenseInfo {
  String? fee; //欠费
  FeeType? feeType; //欠费类型
  String? title;
  String? subTitle;

  ExpenseInfo({
    required this.title,
    required this.subTitle,
    required this.fee,
    this.feeType,
  });
}

class ExpenseDetailedInfo {
  String? houseId;
  String? communityName; //小区名称
  String? houseNum; //房屋号
  String? houseArea; //面积
  String? fee; //欠费
  FeeType? feeType; //欠费类型
}

enum FeeType {
  property, //物业
  health, //卫生管理
  water, //水
  electric, //电
  gas, //天然气
}

// class HouseInfo {
//   String? houseId;
//   String? communityName; //小区名称
//   String? houseNum; //房屋号
//   String? fee; //该房屋的总欠费
// }
