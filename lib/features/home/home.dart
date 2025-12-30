import 'package:customer_ui/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Home'),
      body: Center(child: Text('Home')),
    );
  }
}
