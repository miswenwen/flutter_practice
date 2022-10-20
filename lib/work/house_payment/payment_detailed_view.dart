import 'package:flutter/material.dart';
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
    return Container();
  }

  @override
  void dispose() {
    Get.delete<PaymentDetailedController>();
    super.dispose();
  }
}