import 'package:flutter_phoenix/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_phoenix/enums/page_name.dart';
import 'login_screen.dart';

class LoginScreenRouteConfiguration extends BaseRouteConfiguration {
  LoginScreenRouteConfiguration()
      : super(PageName.Login, builder: (context) => LoginScreen());
}
