import 'package:flutter_phoenix/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_phoenix/enums/page_name.dart';
import 'change_password_screen.dart';

class ChangePasswordScreenRouteConfiguration extends BaseRouteConfiguration {
  ChangePasswordScreenRouteConfiguration()
      : super(
          PageName.ChangePassword,
          builder: (context) => ChangePasswordScreen(),
        );
}
