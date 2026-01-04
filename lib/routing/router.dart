import 'package:beamer/beamer.dart';
// import 'package:customer_ui/routing/accountlocation.dart';
import 'package:customer_ui/routing/customerlocation.dart';
// import 'package:customer_ui/routing/homelocation.dart';
// import 'package:customer_ui/routing/productlocation.dart';
// import 'package:customer_ui/routing/tablocation.dart';

final routerDelegate = BeamerDelegate(
  initialPath: '/customer',
  locationBuilder: BeamerLocationBuilder(beamLocations: [CustomerLocation()]).call,
);

// final routerDelegate = BeamerDelegate(
//   initialPath: '/tabs',
//   locationBuilder: BeamerLocationBuilder(
//     beamLocations: [
//       TabsLocation(),
//       HomeLocation(),
//       AccountLocation(),
//       ProductLocation(),
//       CustomerLocation(),
//     ],
//   ).call,
// );
