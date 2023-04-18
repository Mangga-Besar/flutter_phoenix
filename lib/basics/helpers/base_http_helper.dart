import 'dart:convert';

import 'package:flutter_phoenix/basics/exceptions/http_exception.dart';
import 'package:flutter_phoenix/functions/token_version.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_phoenix/configs/configs.dart';

abstract class BaseHTTPHelper {
  String get route;

  Future<Map<String, dynamic>> post({String? json, String? endpoint}) async {
    return postGenerics<Map<String, dynamic>>(endpoint: endpoint, json: json);
  }

  Future<String> postString({String? json, String? endpoint}) async {
    return postGenerics<String>(endpoint: endpoint, json: json);
  }

  Future<bool> postBool({String? json, String? endpoint}) async {
    return postGenerics<bool>(endpoint: endpoint, json: json);
  }

  Future<T> postGenerics<T>({
    String? json,
    String? endpoint,
  }) async {
    try {
      Map<String, String> headers = {"content-type": "application/json"};
      String token = await TokenVersion.getToken();
      if (token.isNotEmpty) headers["Authorization"] = "Bearer " + token;
      var response = await http.post(
        Uri.parse(Configs.httpLink + "/$route/$endpoint"),
        body: json,
        headers: headers,
      );
      if (response.statusCode == 200) {
        var map;
        try {
          print(response.body);
          map = jsonDecode(response.body);
        } catch (err) {
          print(err);
        }
        return map;
      } else {
        throw HTTPException.fromHTTPError(jsonDecode(response.body));
      }
    } on HTTPException {
      rethrow;
    } catch (err) {
      throw HTTPException.fromError(err as Error);
    }
  }

  Future<T> getGenerics<T>({
    String? json,
    String? endpoint,
  }) async {
    try {
      Map<String, String> headers = {"content-type": "application/json"};
      String token = await TokenVersion.getToken();
      if (token.isNotEmpty) headers["Authorization"] = "Bearer " + token;
      var response = await http.get(
        Uri.parse(Configs.httpLink + "/$route/$endpoint"),
        headers: headers,
      );
      if (response.statusCode == 200) {
        var map;
        try {
          map = jsonDecode(response.body);
        } catch (err) {
          print(err);
        }
        return map;
      } else {
        throw HTTPException.fromHTTPError(jsonDecode(response.body));
      }
    } on HTTPException {
      rethrow;
    } catch (err) {
      throw HTTPException.fromError(err as Error);
    }
  }
  // Future<T> postListGenerics<T>({
  //   String? json,
  //   String? endpoint,
  // }) async {
  //   try {
  //     Map<String, String> headers = {"content-type": "application/json"};
  //     String token = await TokenVersion.getToken();
  //     if (token.isNotEmpty) headers["Authorization"] = "Bearer " + token;
  //     var response = await http.post(
  //       Uri.parse(Configs.httpLink + "/$route/$endpoint"),
  //       body: json,
  //       headers: headers,
  //     );
  //     if (response.statusCode == 200) {
  //       var list = response.body;
  //       return list;
  //     } else {
  //       throw HTTPException.fromHTTPError(jsonDecode(response.body));
  //     }
  //   } on HTTPException {
  //     rethrow;
  //   } catch (err) {
  //     throw HTTPException.fromError(err as Error);
  //   }
  // }

  Future<void> postVoid({String? json, String? endpoint}) async {
    try {
      Map<String, String> headers = {"content-type": "application/json"};
      String token = await TokenVersion.getToken();
      if (token.isNotEmpty) headers["Authorization"] = "Bearer " + token;
      var response = await http.post(
        Uri.parse(Configs.httpLink + "/$route/$endpoint"),
        body: json,
        headers: headers,
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw HTTPException.fromHTTPError(jsonDecode(response.body));
      }
    } on HTTPException {
      rethrow;
    } catch (err) {
      throw HTTPException.fromError(err as Error);
    }
  }
}
