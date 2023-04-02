import 'dart:convert';
import 'dart:io';

import 'package:flutter_phoenix/models/config/config_helper.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'shared_preferences_function.dart';

class TokenVersion {
  SharedPreferencesFunction _sharedPreferencesHelper =
      SharedPreferencesFunction();

  String? _token;
  String? _os;
  String? _userId;
  String? _version;
  String? _path;
  String? _banner;
  String? _logo;
  String? _ccTenantId;

  bool? _sponsor;

  static Future<void> init() async {
    ConfigHelper _configHelper = ConfigHelper();
  }

  static bool getSponsor() {
    return instance!._sponsor!;
  }

  static String getBanner() {
    return instance!._banner!;
  }

  static String getLogo() {
    return instance!._logo!;
  }

  static String getCCTenantId() {
    return instance!._ccTenantId!;
  }

  static String getPath() {
    return instance!._path!;
  }

  static TokenVersion? _instance;

  static TokenVersion? get instance {
    return _instance ?? (_instance = TokenVersion());
  }

  static Future<String?> getVersion() async {
    if (instance?._version == null) {
      var packageInfo = await PackageInfo.fromPlatform();
      instance?._version = packageInfo.version;
    }
    return instance!._version;
  }

  static Future<String?> getOS() async {
    instance?._os ??= Platform.isIOS ? "iOS" : "Android";
    return instance!._os;
  }

  static Future<String> getVersionString() async {
    var os = await getOS();
    var version = await getVersion();
    return "vers. $os $version";
  }

  static Future<String> getToken() async {
    instance?._token ??=
        await instance!._sharedPreferencesHelper.getValue('token');
    return instance!._token ?? "";
  }

  static Future<String> getUserId() async {
    instance?._userId ??=
        await instance!._sharedPreferencesHelper.getValue('userId');
    return instance!._userId ?? "";
  }

  static Future<void> setTokenAndUserId(String token, String userId) async {
    await instance!._sharedPreferencesHelper.setStringValue('token', token);
    await setUserId(userId);
    instance!._token = token;
    instance!._userId = userId;
  }

  static Future<void> setUserId(String userId) async {
    await instance!._sharedPreferencesHelper.setStringValue('userId', userId);
  }

  static Future<void> clearTokenAndUserId() async {
    await instance!._sharedPreferencesHelper.removeValue('userId');
    await instance!._sharedPreferencesHelper.removeValue('token');
    instance!._token = null;
    instance!._userId = null;
  }

  static Future<bool> hasUser() async {
    return (await getUserId()) != null;
  }

  static Future<void> setSponsor(String sponsor) async {}
}
