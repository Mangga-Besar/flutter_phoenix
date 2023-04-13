import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/screens/user/user_page.dart';

class UserScreen extends BaseScreenWithAppBar {
  UserScreen()
      : super(
          "Home",
          PageName.User,
          scrollable: false,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    User user = args["user"];

    return UserPage(
      user: user,
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

    User user = args["user"];

    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            UserHelper().delete(user.id ?? "");
            Routes.pop(context);
          },
          icon: Icon(
            Icons.delete,
          ),
        )
      ],
    );
  }
}
