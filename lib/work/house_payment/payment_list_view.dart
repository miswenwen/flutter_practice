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
        return Column(
          children: [
            totalFeeSection(),
            expenseListSection(),
          ],
        );
      },
    );
  }

  ///用sticky_headers这个库来把Header实现冻结窗格的效果，官方库
  Widget totalFeeSection() {
    return Container();
  }

  Widget expenseListSection() {
    return Container();
  }
}
