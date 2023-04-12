import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_phoenix/enums/page_name.dart';
import 'user_screen.dart';

class UserScreenRouteConfiguration extends BaseRouteConfiguration {
  UserScreenRouteConfiguration() : super(PageName.User);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return UserScreen();
  }
}
