import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/user_type.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';

class User with ChangeNotifier {
  static User? _empty;
  final String? id;
  final String? name;
  final String? subName;
  final String? email;
  final String? handPhone;
  final UserType type;
  String? messagingToken;
  bool? isBlocked;

  User({
    this.id,
    this.name,
    this.email,
    this.handPhone,
    this.type = UserType.Member,
    this.messagingToken,
    this.isBlocked = false,
  })  : subName = getInitial(name!),
        assert(name.isNotEmpty);

  static User empty() {
    return _empty ??= User(name: "EMPTY");
  }

  bool get isEmpty => this == User.empty();

  bool get isCommitee => type == UserType.Committee;
  bool get isSuper => type == UserType.Super;
  bool get isFinance => type == UserType.Finance;

  static User? fromMap(Map<String, dynamic>? data) {
    return data == null
        ? null
        : User(
            id: data["id"] ?? "",
            name: data["name"] ?? "",
            email: data["email"] ?? "",
            handPhone: data["handPhone"] ?? "",
            type: EnumParser.getEnum(UserType.values, data["type"] ?? "Member"),
            messagingToken: data["messagingToken"] ?? "",
            isBlocked: data["isBlocked"] ?? false,
          );
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "handPhone": handPhone,
      "type": EnumParser.getString(type),
      "messagingToken": messagingToken,
      "isBlocked": isBlocked,
    };
  }

  Map<String, dynamic> toChatVariables() {
    return {
      "id": id,
      "name": name,
      "messagingToken": messagingToken,
    };
  }

  static String getInitial(String name) {
    var chunks = name.toUpperCase().split(" ");
    if (chunks.length < 2) {
      return chunks[0].substring(0, 1);
    } else {
      return chunks[0].substring(0, 1) + chunks[1].substring(0, 1);
    }
  }

  static Color getAvatarColor(String name) {
    var length = name.length % Configs.colorAvatars.length;
    return Configs.colorAvatars[length];
  }

  Future<void> update() async {
    // await instance.collection('users').doc(id).update(toVariables());
  }

  static Future<User?> load(String uid) async {
    // var document = await instance.collection('users').doc(uid).get();
    // return User.fromMap(document.data()!);
  }
}
