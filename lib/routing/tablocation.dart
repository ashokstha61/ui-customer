// import 'package:beamer/beamer.dart';
// import 'package:customer_ui/features/account/account.dart';
// import 'package:customer_ui/features/customer/presentation/customer.dart';
// import 'package:customer_ui/features/customer/presentation/customerdetails.dart';
// import 'package:customer_ui/features/customer/presentation/extended_on_added.dart';
// import 'package:customer_ui/features/customer/presentation/ordersummary.dart';
// import 'package:customer_ui/features/home/home.dart';
// import 'package:customer_ui/features/home/tabs.dart';
// import 'package:customer_ui/features/product/product.dart';
// import 'package:flutter/material.dart';

// class TabsLocation extends BeamLocation<BeamState> {
//   @override
//   List<String> get pathPatterns => [
//     '/tabs/home',
//     '/tabs/product',
//     '/tabs/account',
//     '/tabs/customer',
//     '/tabs/customer/add',
//     '/tabs/customer/details',
//     '/tabs/customer/summary',
//   ];

//   @override
//   List<BeamPage> buildPages(BuildContext context, BeamState state) {
//     final pages = <BeamPage>[
//       const BeamPage(key: ValueKey('tabs'), child: Tabs()),
//     ];

//     final segments = state.uri.pathSegments;

//     if (segments.contains('home')) {
//       pages.add(const BeamPage(child: Home()));
//     } else if (segments.contains('product')) {
//       pages.add(const BeamPage(child: Product()));
//     } else if (segments.contains('account')) {
//       pages.add(const BeamPage(child: Account()));
//     } else if (segments.contains('customer')) {
//       pages.add(const BeamPage(child: Customer()));
//     }

//     if (segments.contains('add')) {
//       pages.add(const BeamPage(child: ExtendedOnAdded()));
//     }
//     if (segments.contains('details')) {
//       pages.add(const BeamPage(child: Customerdetails()));
//     }
//     if (segments.contains('summary')) {
//       pages.add(const BeamPage(child: Ordersummary()));
//     }

//     return pages;
//   }
// }
