import 'package:flutter_phoenix/models/user/user.dart';

class LoginResult {
  String? token;
  String? userId;

  LoginResult({this.token, this.userId});

  LoginResult.fromMap(Map<String, dynamic> data)
      : this(
          token: data["jwt"],
          userId: data["id"],
        );
}
