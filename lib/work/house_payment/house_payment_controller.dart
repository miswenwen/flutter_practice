import 'package:get/get.dart';

class HousePaymentController extends GetxController {
  //房屋列表
  List<HouseInfo> houseList = [];

  //单个房屋的欠费总计，网络请求拿，因为列表项都是分块加载的，所以自己算不了，得后台算好，我们取
  var totalExpense;

  //费用集合，k是房屋ID，v是该房屋的费用列表
  Map<String, List<ExpenseInfo>> expenseMap = {};

  @override
  void onInit() {
    super.onInit();
    prepareDefaultData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void prepareDefaultData() {}
}

class ExpenseInfo {
  String? houseId;
  String? communityName; //小区名称
  String? houseNum; //房屋号
  String? houseArea; //面积
  String? fee; //欠费
  FeeType? feeType; //欠费类型
}

enum FeeType {
  property, //物业
  water, //水
  electric, //电
  gas, //天然气
}

class HouseInfo {
  String? houseId;
  String? communityName; //小区名称
  String? houseNum; //房屋号
  String? fee; //该房屋的总欠费
}
