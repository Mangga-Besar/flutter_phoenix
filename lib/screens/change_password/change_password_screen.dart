import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/basics/screens/base_screen.dart';
import 'package:flutter_phoenix/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/screens/change_password/change_password_page.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';

class ChangePasswordScreen extends BaseScreenWithAppBar {
  ChangePasswordScreen()
      : super(
          "GANTI PASSWORD",
          PageName.ChangePassword,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    return ChangePasswordPage();
  }

  @override
  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const CustomText("GANTI PASSWORD", fontSize: 20),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  @override
  Widget? drawer(BuildContext context) {
    return null;
  }
}
