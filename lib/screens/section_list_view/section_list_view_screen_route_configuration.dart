import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_phoenix/enums/page_name.dart';
import 'section_list_view_screen.dart';

class SectionListViewScreenRouteConfiguration extends BaseRouteConfiguration {
  SectionListViewScreenRouteConfiguration() : super(PageName.SectionList);

  @override
  Future<Widget> getScreen(BuildContext context) async {
    return SectionListViewScreen();
  }
}
