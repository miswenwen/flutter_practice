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
        child: GetBuilder<PaymentDetailedController>(
          assignId: true,
          builder: (controller) {
            return Hero(
              tag: controller.heroTag,
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: FeeDetailedTile(),
              ),
            );
          },
        ),
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
              itemCount: 1,
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
      elevation: 5,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 9),
        //这里用Column，配合Hero动画竟然有问题，得改用ListView把高度算死
        child: MediaQuery.removePadding(
          context: Get.context!,
          removeTop: true,
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                '锦绣花园社区',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '欠费',
                style: TextStyle(
                  color: Color(0xFFF26752),
                  fontSize: 12,
                ),
              ),
              Text(
                '2875.36',
                style: TextStyle(
                  color: Color(0xFFF26752),
                  fontSize: 30,
                ),
              ),
              InfoLine(),
              InfoLine(),
              InfoLine(),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoLine extends StatelessWidget {
  const InfoLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            'aaa',
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 13,
            ),
          ),
          Spacer(),
          Text(
            'bbb',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
