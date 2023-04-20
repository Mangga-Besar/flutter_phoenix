import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/screens/report_list/report_list_view_page.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';
import 'package:flutter_phoenix/widgets/home_drawer.dart';

class ReportListViewScreen extends BaseScreenWithAppBar {
  ReportListViewScreen()
      : super(
          "UserListView",
          PageName.ReportList,
          scrollable: false,
          padding: EdgeInsets.zero,
        );
  @override
  Widget content(BuildContext context) {
    return ReportListViewPage();
  }

  @override
  Widget? drawer(BuildContext context) {
    return const HomeDrawer(selected: PageName.ReportList);
  }

  @override
  Widget? floatingActionButton(BuildContext context) {
    // TODO: implement floatingActionButton
    return UserBuilder(builder: (user) {
      if (user!.isCommitee || user.isSuper) {
        return FloatingActionButton(
          onPressed: () async {
            await Routes.push(context, PageName.Report);
          },
          child: Icon(Icons.add),
        );
      }
      return Container();
    });
  }
}
