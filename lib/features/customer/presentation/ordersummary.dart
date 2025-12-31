import 'package:beamer/beamer.dart';
import 'package:customer_ui/core/widgets/custom_appbar.dart';
import 'package:customer_ui/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Ordersummary extends StatelessWidget {
  const Ordersummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Order Summary',
      ),
      body: Column(
        children: [
          Row(children: [Text('data')]),
        ],
      ),
    );
  }
}
