import 'package:customer_ui/core/constant/app_color.dart';
import 'package:customer_ui/features/account/account.dart';
import 'package:customer_ui/features/customer/presentation/customer.dart';
import 'package:customer_ui/features/home/home.dart';
import 'package:customer_ui/features/product/product.dart';
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
    Product(),
    Account(),
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

// import 'package:beamer/beamer.dart';
// import 'package:flutter/material.dart';
// import 'package:customer_ui/core/constant/app_color.dart';

// class Tabs extends StatefulWidget {
//   const Tabs({super.key});

//   @override
//   State<Tabs> createState() => _TabsState();
// }

// class _TabsState extends State<Tabs> {
//   int _currentIndex = 0;

//   final List<String> _tabPaths = ['/tabs/home', '/tabs/product', '/tabs/account', '/tabs/customer'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: AppColor.buttonColor,
//         unselectedItemColor: Colors.grey,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//           Beamer.of(context).beamToNamed(_tabPaths[index]);
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Image.asset('assets/images/home.png', width: 24, height: 24),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/images/product.png',
//               width: 24,
//               height: 24,
//             ),
//             label: 'Product',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/images/account.png',
//               width: 24,
//               height: 24,
//             ),
//             label: 'Account',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset('assets/images/menu.png', width: 24, height: 24),
//             label: 'Menu',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Tabs extends StatelessWidget {
//   const Tabs({super.key});

//   static const tabRoutes = [
//     '/tabs/home',
//     '/tabs/product',
//     '/tabs/account',
//     '/tabs/customer',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final uri = Beamer.of(context).currentBeamLocation.state.uri;

//     int currentIndex = tabRoutes.indexWhere(
//       (path) => uri.path.startsWith(path),
//     );

//     if (currentIndex == -1) currentIndex = 0;

//     return Scaffold(
//       body: const Beamer(), // ✅ REQUIRED
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: AppColor.buttonColor,
//         onTap: (index) {
//           Beamer.of(context).beamToNamed(tabRoutes[index]);
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.inventory),
//             label: 'Product',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Account',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: 'Menu',
//           ),
//         ],
//       ),
//     );
//   }
// }
