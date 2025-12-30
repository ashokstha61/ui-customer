import 'package:beamer/beamer.dart';
import 'package:customer_ui/routing/homelocation.dart';

final routerDelegate = BeamerDelegate(
      initialPath: '/customer',
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [
          HomeLocation(),
        ],
      ),
    );