import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/enums/user_type.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/report/report.dart';
import 'package:flutter_phoenix/models/report/report_helper.dart';
import 'package:flutter_phoenix/screens/edit_report/edit_report_page.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';
import 'package:flutter_phoenix/widgets/home_drawer.dart';

class EditReportScreen extends BaseScreenWithAppBar {
  EditReportScreen()
      : super(
          "UserListView",
          PageName.EditReport,
          scrollable: false,
          padding: EdgeInsets.zero,
        );
  @override
  Widget content(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    Report? report = args["report"];

    return EditReportPage(
      report: report,
    );
  }

  @override
  Widget? drawer(BuildContext context) {
    return null;
  }

  @override
  AppBar? appBar(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    Report? report = args["report"];
    return AppBar(
      actions: [
        UserBuilder(
          builder: (user) {
            if (user!.id == report!.userId || user.isSuper || user.isCommitee) {
              return IconButton(
                  onPressed: () {
                    ReportHelper().delete(report.id!);
                    Routes.pop(context);
                  },
                  icon: Icon(Icons.delete));
            }
          },
        )
      ],
    );
  }
}
