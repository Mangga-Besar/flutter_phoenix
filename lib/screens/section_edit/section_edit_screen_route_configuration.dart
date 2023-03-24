import 'package:flutter_phoenix/basics/route_configurations/base_route_configuration.dart';

import 'package:flutter_phoenix/enums/page_name.dart';
import 'section_edit_screen.dart';

class SectionEditScreenRouteConfiguration extends BaseRouteConfiguration {
  SectionEditScreenRouteConfiguration()
      : super(PageName.EditSection, builder: (context) => SectionEditScreen());
}
