import 'package:flutter_phoenix/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_phoenix/enums/page_name.dart';
import 'verification_key_screen.dart';

class VerificationKeyScreenRouteConfiguration extends BaseRouteConfiguration {
  VerificationKeyScreenRouteConfiguration()
      : super(
          PageName.VerificationKey,
          builder: (context) => VerificationKeyScreen(),
        );
}
