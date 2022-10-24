import 'package:flutter/material.dart';
import 'package:flutter_practice/work/house_payment/payment_detailed_view.dart';
import 'package:get/get.dart';
import 'package:noripple_overscroll/noripple_overscroll.dart';

import 'base_widget.dart';
import 'payment_list_controller.dart';

//考虑到费用列表不像新闻列表那样会很长甚至无限加载，最多也就个3,5屏，做成一次性加载算了
class PaymentListPage extends StatefulWidget {
  const PaymentListPage({Key? key}) : super(key: key);

  @override
  _PaymentListPageState createState() => _PaymentListPageState();
}

class _PaymentListPageState extends State<PaymentListPage> {
  final paymentListController = Get.put(PaymentListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: WithToolbar(
        title: '欠费缴费',
        child: mainArea(),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<PaymentListController>();
    super.dispose();
  }

  Widget mainArea() {
    return GetBuilder<PaymentListController>(
      assignId: true,
      builder: (controller) {
        return Container(
          height: double.infinity,
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
          child: NoRippleOverScroll(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    totalFeeSection(),
                    SizedBox(height: 22),
                    expenseListSection(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  ///用sticky_headers这个库来把Header实现冻结窗格的效果，官方库
  Widget totalFeeSection() {
    return Container(
        width: double.infinity,
        height: 80,
        decoration: const BoxDecoration(
          color: Color(0xFF1890FF),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        padding: const EdgeInsets.only(top: 11, bottom: 11, left: 20, right: 18.5),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '欠费总计',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '2875.36',
                style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide(width: 1, color: Colors.white),
                ),
                onPressed: () {},
                child: Text(
                  '立即缴费',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ));
  }

  Widget expenseListSection() {
    int count = 25;
    return MediaQuery.removePadding(
      context: Get.context!,
      removeTop: true,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              child: ExpenseTile(),
            );
          }
          if (index == count - 1) {
            return ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
              child: ExpenseTile(),
            );
          }
          return ExpenseTile();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 1,
            height: 1,
            color: Colors.transparent,
          );
        },
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: count,
      ),
    );
  }
}

class ExpenseTile extends StatefulWidget {
  const ExpenseTile({Key? key}) : super(key: key);

  @override
  State<ExpenseTile> createState() => _ExpenseTileState();
}

class _ExpenseTileState extends State<ExpenseTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PaymentDetailedPage());
      },
      child: Container(
        width: double.infinity,
        color: randomColor(),
        height: 60,
        padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LimitedBox(
                  maxWidth: 200,
                  child: Text(
                    '小区',
                    maxLines: 1,
                    style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),
                LimitedBox(
                  maxWidth: 200,
                  child: Text(
                    '1号楼' * 30,
                    maxLines: 1,
                    style: TextStyle(color: Color(0xFF666666), fontSize: 12),
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              '2875.36',
              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 13.5,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12,
            ),
            // Image.asset(
            //   'assets/images/home/arrows.png',
            //   width: 12,
            //   height: 12,
            // )
          ],
        ),
      ),
    );
  }
}
