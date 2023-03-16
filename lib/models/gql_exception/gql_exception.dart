import 'dart:convert';

// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/functions/toast_helper.dart';
import 'package:flutter_phoenix/screens/home/home_screen.dart';

class GQLException implements Exception {
  final int? id;
  final String? message;
  GQLException({
    this.id,
    this.message,
  });

  Map<int, String> errorMap = {
    100: "Login Gagal",
    101: "Akun Tidak Ditemukan",
    102: "Username Sudah Terdaftar",
    200: "Data Tidak Ditemukan",
    400: "Sesi Sudah Berakhir",
    401: "Sesi Sudah Berakhir",
  };

  GQLException.fromJson(dynamic json)
      : this(
          id: json["id"],
          message: json["message"],
        );

  static GQLException fromError(dynamic error) {
    try {
      if (error is GQLException) return error;
      var json = jsonDecode(error);
      return GQLException.fromJson(json);
    } catch (_) {
      // FirebaseCrashlytics.instance.recordError(error, StackTrace.current);
      return GQLException(message: error);
    }
  }

  static Future<void> exceptionHandler(
      BuildContext context, dynamic err) async {
    var gqlEx = fromError(err);
    gqlEx.process(context);
    ToastHelper.showGQLException(gqlEx, context);
  }

  String? getMessage() {
    return errorMap[id] ?? message;
  }

  Future<void> process(BuildContext context) async {
    if (id == 400 || id == 401) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
        (Route<dynamic> route) => route.isFirst,
      );
      // Routes.pushAndRemoveUntil(context, PageName.Home);
    }
  }
}
