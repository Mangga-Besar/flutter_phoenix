import 'dart:convert';

import 'package:flutter_phoenix/models/login/login_data.dart';
import 'package:flutter_phoenix/models/login/login_result.dart';
import 'package:flutter_phoenix/basics/helpers/base_http_helper.dart';
import 'package:flutter_phoenix/models/user/user.dart';

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

  Future<void> updateUser(String id, User user) async {
    var map = jsonEncode(user.toVariables());
    var result = await post(endpoint: "update", json: map);
    print(result);
    // return result;
  }

  Future<LoginResult> login(LoginData data) async {
    var map = data.toJSON();
    var result = await post(endpoint: "login", json: map);
    return LoginResult.fromMap(result);
  }

  Future<void> delete(String id) async {
    var map = {"id": id};
    var jsonMap = jsonEncode(map);

    var result = await getGenerics(endpoint: "delete/$id", json: jsonMap);
    return result;
  }

  Future<User> getUser(String id) async {
    var map = {"id": id};
    var jsonMap = jsonEncode(map);
    var result = await post(endpoint: "load", json: jsonMap);
    return User.fromMap(result) ?? User.empty();
  }

  Future<List<User?>> getUserList(int start, int length) async {
    var map = {
      "filter": {"int": start, "length": length}
    };
    var jsonMap = jsonEncode(map);
    var res = await postGenerics(endpoint: "list", json: jsonMap);
    var result = res.map((e) => jsonDecode(e)).toList();
    return User.fromMapList(result);
  }

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
}
