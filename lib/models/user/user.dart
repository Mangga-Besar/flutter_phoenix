import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/role_type.dart';
import 'package:flutter_phoenix/enums/user_type.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';

class User with ChangeNotifier {
  static User? _empty;
  String? id;
  String? name;
  String? nik;
  String? email;
  String? handPhone;
  String? schoolId;
  String? password;
  String? address;
  String? agama;
  DateTime? dob;
  RoleType roleType;
  UserType userType;

  List<ISection>? kontak;
  List<ISection>? pendidikan;
  List<ISection>? pelatihan;
  List<ISection>? publikasi;
  List<ISection>? penugasan;

  User({
    this.id,
    this.name,
    this.nik,
    this.email,
    this.handPhone,
    this.schoolId,
    this.password,
    this.address,
    this.agama,
    this.dob,
    this.userType = UserType.Committee,
    this.roleType = RoleType.Karyawan,
    this.kontak,
    this.pelatihan,
    this.pendidikan,
    this.penugasan,
    this.publikasi,
  });

  static User empty() {
    return _empty ??= User(name: "EMPTY");
  }

  bool get isEmpty => this == User.empty();

  bool get isCommitee => userType == UserType.Committee;
  bool get isSuper => userType == UserType.Super;

  User copy() {
    return User(
      id: id,
      name: name,
      nik: nik,
      email: email,
      handPhone: handPhone,
      userType: userType,
      roleType: roleType,
      dob: dob,
      address: address,
      agama: agama,
      password: password,
      schoolId: schoolId,
    );
  }

  static User? fromMap(Map<String, dynamic>? data) {
    return data == null
        ? null
        : User(
            id: data["id"] ?? "",
            name: data["name"] ?? "",
            nik: data["nik"] ?? "",
            email: data["email"] ?? "",
            handPhone: data["handPhone"] ?? "",
            userType: EnumParser.getEnum(
                UserType.values, data["userType"] ?? "Member"),
            roleType:
                EnumParser.getEnum(RoleType.values, data["roleType"] ?? "Guru"),
            dob: DateTime.tryParse(data["dob"]),
            address: data["address"],
            agama: data["agama"],
            password: data["password"],
            schoolId: data["schoolId"],
          );
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "name": name,
      "nik": nik,
      "email": email,
      "handPhone": handPhone,
      "schoolId": schoolId,
      "userType": EnumParser.getString(userType),
      "roleType": EnumParser.getString(roleType),
      "dob": dob.toString(),
      "address": address,
      "agama": agama,
      "password": password,
    };
  }

  Future<void> update() async {
    // await instance.collection('users').doc(id).update(toVariables());
  }

  static Future<User?> load(String uid) async {
    // var document = await instance.collection('users').doc(uid).get();
    // return User.fromMap(document.data()!);
  }
}
