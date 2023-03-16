import 'dart:convert';

import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/basics/helpers/base_http_helper.dart';

class UserHelper extends BaseHTTPHelper {
  // final instance = FirebaseFirestore.instance;

  @override
  String get route => "user";

  // Future<User> get(String userId) async {
  // return await instance
  //     .collection('users')
  //     .doc(userId)
  //     .get()
  //     .mapDoc(User.fromMap, User.empty());
  // }

  // Future<bool> delete(String userId) async {
  //   var data = LoginData();
  //   data.email = userId;
  //   await post(endpoint: "delete", json: data.toJSON());
  //   return true;
  // }

  // Future<LoginResult> login(LoginData data) async {
  //   var result = await post(endpoint: "login", json: data.toJSON());
  //   return LoginResult.fromMap(result);
  // }

  // Future<User?> register(RegisterData data) async {
  //   var result =
  //       await post(endpoint: "register", json: data.toRegistrationJSON());
  //   return User.fromMap(result);
  // }

  Future<bool> forgetPassword(String email) async {
    var map = {"email": email};
    var result = await post(
      endpoint: "forgetpassword",
      json: jsonEncode(map),
    );
    return result['result'] as bool;
  }

  Future<bool> changePassword(
      String email, String oldPassword, String newPassword) async {
    var map = {
      "email": email,
      "oldPassword": oldPassword,
      "newPassword": newPassword,
    };
    var result = await post(
      endpoint: "changepassword",
      json: jsonEncode(map),
    );
    return result['result'] as bool;
  }

  Future<bool> newPassword(String email, String code, String password) async {
    var map = {"email": email, "code": code, "password": password};
    var result = await post(
      endpoint: "newpassword",
      json: jsonEncode(map),
    );
    return result['result'] as bool;
  }

  Future<bool> verifyEmail(String email, String code) async {
    var map = {"email": email, "code": code};
    var result = await post(
      endpoint: "verify",
      json: jsonEncode(map),
    );
    return result['result'] as bool;
  }

  Future<void> resendEmail(String email) async {
    await postVoid(
      endpoint: "sendverification",
      json: jsonEncode({"email": email}),
    );
  }

  Future<void> updateMessagingToken(String messagingToken) async {
    await postVoid(
      endpoint: "updatemessagingtoken",
      json: jsonEncode({"messagingToken": messagingToken}),
    );
  }

  Future<void> block(String userId) async {
    await postVoid(
      endpoint: "setBlocked",
      json: jsonEncode({"id": userId}),
    );
  }
}
