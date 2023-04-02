import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/extensions/string_extensions.dart';

class LoginData extends ChangeNotifier {
  String email = "";
  String password = "";
  String messagingToken = "";
  bool autoValidate = false;

  String? usernameValidator() {
    return email.isEmpty ? "Alamat E-Mail tidak boleh kosong" : null;
  }

  String? passwordValidator() {
    return password.isEmpty ? "Password tidak boleh kosong" : null;
  }

  Map<String, String> toVariables() {
    return {
      "email": email.trimLower(),
      "password": password,
      "messagingToken": messagingToken,
    };
  }

  String toJSON() {
    return jsonEncode(toVariables());
  }
}
