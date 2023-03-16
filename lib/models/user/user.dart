import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/user_type.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';

class User with ChangeNotifier {
  static User? _empty;
  final String? id;
  final String? tenantId;
  final String? name;
  final String? subName;
  final String? classRoom;
  final int? number;
  final Color? avatarColor;
  final String? email;
  final String? handPhone;
  final String? institution;
  final UserType type;
  String? messagingToken;
  bool? isBlocked;

  User({
    this.id,
    this.tenantId,
    this.name,
    this.classRoom,
    this.number,
    this.email,
    this.handPhone,
    this.institution,
    this.type = UserType.Member,
    this.messagingToken,
    this.isBlocked = false,
  })  : subName = getInitial(name!),
        avatarColor = getAvatarColor(name),
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
            tenantId: data["tenantId"] ?? "",
            name: data["name"] ?? "",
            classRoom: data["classRoom"] ?? "",
            number: data["number"] ?? 0,
            email: data["email"] ?? "",
            handPhone: data["handPhone"] ?? "",
            institution: data["institution"] ?? "",
            type: EnumParser.getEnum(UserType.values, data["type"] ?? "Member"),
            messagingToken: data["messagingToken"] ?? "",
            isBlocked: data["isBlocked"] ?? false,
          );
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "tenantId": tenantId,
      "name": name,
      "classRoom": classRoom,
      "number": number,
      "email": email,
      "handPhone": handPhone,
      "institution": institution,
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
