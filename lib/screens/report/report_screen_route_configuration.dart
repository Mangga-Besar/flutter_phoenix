import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_phoenix/enums/page_name.dart';
import 'report_screen.dart';

class ReportScreenRouteConfiguration extends BaseRouteConfiguration {
  ReportScreenRouteConfiguration() : super(PageName.Report);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return ReportScreen();
  }
}
