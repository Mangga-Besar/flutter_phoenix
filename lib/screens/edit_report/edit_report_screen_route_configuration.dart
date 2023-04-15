import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_phoenix/enums/page_name.dart';

import 'edit_report_screen.dart';

class EditReportScreenRouteConfiguration extends BaseRouteConfiguration {
  EditReportScreenRouteConfiguration() : super(PageName.EditReport);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return EditReportScreen();
  }
}
