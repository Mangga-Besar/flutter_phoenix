import 'package:flutter_phoenix/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_phoenix/enums/page_name.dart';
import 'forget_password_screen.dart';

class ForgetPasswordScreenRouteConfiguration extends BaseRouteConfiguration {
  ForgetPasswordScreenRouteConfiguration()
      : super(
          PageName.ForgetPassword,
          builder: (context) => ForgetPasswordScreen(),
        );
}
