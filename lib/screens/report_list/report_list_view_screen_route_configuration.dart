import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_phoenix/enums/page_name.dart';
import 'report_list_view_screen.dart';

class ReportListViewScreenRouteConfiguration extends BaseRouteConfiguration {
  ReportListViewScreenRouteConfiguration() : super(PageName.ReportList);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return ReportListViewScreen();
  }
}
