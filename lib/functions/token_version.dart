import 'dart:convert';
import 'dart:io';

import 'package:flutter_phoenix/models/config/config_helper.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'shared_preferences_function.dart';

class TokenVersion {
  SharedPreferencesFunction _sharedPreferencesHelper =
      SharedPreferencesFunction();

  String? _token;
  String? _os;
  User? _user;
  String? _version;
  String? _path;
  String? _banner;
  String? _logo;
  String? _ccTenantId;

  bool? _sponsor;

  static Future<void> init() async {
    ConfigHelper _configHelper = ConfigHelper();

    // final futures = [
    //   _configHelper.getSponsor(),
    //   _configHelper.getBanner("mobile"),
    //   _configHelper.getImage("mobile"),
    //   _configHelper.getCCTenantId(),
    // ];

    // final results = await Future.wait(futures);

    // instance!._sponsor = results[0] as bool;
    // instance!._banner = results[1] as String;
    // instance!._logo = results[2] as String;
    // instance!._ccTenantId = results[3] as String;
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

  static Future<User?> getUser() async {
    if (instance!._user == null) {
      var userString =
          await instance!._sharedPreferencesHelper.getValue('user');
      Map<String, dynamic>? userMap;
      try {
        userMap = jsonDecode(userString!);
      } catch (err) {
        userMap = null;
      }
      instance!._user =
          (userMap == null ? User.empty() : User.fromMap(userMap))!;
    }
    return instance!._user;
  }

  static Future<String?> getUserId() async {
    var user = await getUser();
    return user?.id;
  }

  static Future<void> setTokenAndUser(String token, User user) async {
    await instance!._sharedPreferencesHelper.setStringValue('token', token);
    await setUser(user);
    instance!._token = token;
    instance!._user = user;
  }

  static Future<void> setUser(User user) async {
    var userVariables = user.toVariables();
    var userString = jsonEncode(userVariables);
    await instance!._sharedPreferencesHelper.setStringValue('user', userString);
  }

  static Future<void> clearTokenAndUser() async {
    await instance!._sharedPreferencesHelper.removeValue('user');
    await instance!._sharedPreferencesHelper.removeValue('token');
    instance!._token = null;
    instance!._user = null;
  }

  static Future<bool> hasUser() async {
    return (await getUser()) != null;
  }

  static Future<void> setSponsor(String sponsor) async {}
}
