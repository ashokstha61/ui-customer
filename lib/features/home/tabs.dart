import 'package:customer_ui/core/constant/app_color.dart';
import 'package:customer_ui/features/customer/presentation/customer.dart';
import 'package:customer_ui/features/home/home.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Home(),
    Center(child: Text('Product')),
    Center(child: Text('Account')),
    Customer(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.buttonColor,
        unselectedItemColor: Colors.grey,

        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png', width: 24, height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/product.png',
              width: 24,
              height: 24,
            ),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/account.png',
              width: 24,
              height: 24,
            ),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/menu.png', width: 24, height: 24),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
