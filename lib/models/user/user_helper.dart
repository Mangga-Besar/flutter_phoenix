import 'dart:convert';
import 'dart:io';

import 'package:flutter_phoenix/basics/exceptions/http_exception.dart';
import 'package:flutter_phoenix/functions/token_version.dart';
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
    if (result["error"] != null) {
      throw HttpException(result["error"]);
    }
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
    try {
      var result = res.map((e) => jsonDecode(e)).toList();
      return User.fromMapList(result);
    } catch (err) {
      return [];
    }
  }

  Future<bool> forgetPassword(String email) async {
    var map = {"email": email};
    try {
      var result = await postString(
        endpoint: "forgetPassword",
        json: jsonEncode(map),
      );
      if (result == "true") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<LoginResult> validateKey(String email, String key) async {
    var map = {"email": email, "key": key};
    var result = await postString(
      endpoint: "validateKey",
      json: jsonEncode(map),
    );
    var log = jsonDecode(result);
    var login = LoginResult.fromMap(log);
    return login;
  }

  Future<bool> changePassword(String newPassword) async {
    var map = {
      "new_password": newPassword,
    };
    var result = await postBool(
      endpoint: "changePassword",
      json: jsonEncode(map),
    );
    return result;
  }
}
