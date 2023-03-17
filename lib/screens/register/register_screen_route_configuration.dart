import 'package:flutter_phoenix/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_phoenix/enums/page_name.dart';
import 'register_screen.dart';

class RegisterScreenRouteConfiguration extends BaseRouteConfiguration {
  RegisterScreenRouteConfiguration()
      : super(PageName.Register, builder: (context) => RegisterScreen());
}
