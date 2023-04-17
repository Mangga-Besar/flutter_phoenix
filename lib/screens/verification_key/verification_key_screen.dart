import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/screens/base_screen.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/screens/verification_key/verification_key_page.dart';

class VerificationKeyScreen extends BaseScreen {
  VerificationKeyScreen()
      : super(PageName.VerificationKey, padding: EdgeInsets.zero);

  @override
  Widget content(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String email = args == null ? "" : args['email'];
    return VerificationKeyPage(email: email);
  }

  @override
  Widget? drawer(BuildContext context) {
    return null;
  }
}
