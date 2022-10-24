import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_widget.dart';
import 'payment_list_controller.dart';

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
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              totalFeeSection(),
              SizedBox(height: 22),
              Expanded(child: expenseListSection()),
            ],
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
                // child: Container(
                //   height: 35,
                //   width: 100,
                //   alignment: Alignment.center,
                //   child: Text(
                //     '立即缴费',
                //     style: TextStyle(color: Colors.white, fontSize: 16),
                //   ),
                // ),
              ),
            )
          ],
        ));
  }

  Widget expenseListSection() {
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
          if (index == 2) {
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
        itemCount: 3,
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
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: 60,
      padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '小区',
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                '1号楼',
                style: TextStyle(color: Color(0xFF666666), fontSize: 12),
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
          Image.asset(
            'assets/images/home/contacts.png',
            width: 12,
            height: 12,
          )
        ],
      ),
    );
  }
}
