import 'package:flutter/material.dart';
import 'package:flutter_practice/work/house_payment/base_widget.dart';
import 'package:get/get.dart';

import 'payment_detailed_controller.dart';

class PaymentDetailedPage extends StatefulWidget {
  const PaymentDetailedPage({Key? key}) : super(key: key);

  @override
  _PaymentDetailedPageState createState() => _PaymentDetailedPageState();
}

class _PaymentDetailedPageState extends State<PaymentDetailedPage> {
  final controller = Get.put(PaymentDetailedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: WithToolbar(
        title: '账单详情',
        child: mainArea(),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<PaymentDetailedController>();
    super.dispose();
  }

  Widget mainArea() {
    return GetBuilder<PaymentDetailedController>(
      assignId: true,
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: MediaQuery.removePadding(
            context: Get.context!,
            removeTop: true,
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return FeeDetailedTile();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 0,
                  height: 0,
                  color: Colors.transparent,
                );
              },
              itemCount: 5,
            ),
          ),
        );
      },
    );
  }
}

class FeeDetailedTile extends StatefulWidget {
  const FeeDetailedTile({Key? key}) : super(key: key);

  @override
  State<FeeDetailedTile> createState() => _FeeDetailedTileState();
}

class _FeeDetailedTileState extends State<FeeDetailedTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}
