import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/screens/report/report_page.dart';
import 'package:flutter_phoenix/widgets/home_drawer.dart';

class ReportScreen extends BaseScreenWithAppBar {
  ReportScreen()
      : super(
          "UserListView",
          PageName.Report,
          scrollable: false,
          padding: EdgeInsets.zero,
        );
  @override
  Widget content(BuildContext context) {
    return ReportPage();
  }

  @override
  Widget? drawer(BuildContext context) {
    return const HomeDrawer(selected: PageName.Report);
  }
}
