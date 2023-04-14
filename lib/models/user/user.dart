import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/role_type.dart';
import 'package:flutter_phoenix/enums/user_type.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';

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
  String? profilePicture;
  String? agama;
  DateTime? dob;
  RoleType roleType;
  UserType userType;

  List<KontakSection?>? kontak;
  List<PendidikanSection?>? pendidikan;
  List<PelatihanSection?>? pelatihan;
  List<PublikasiSection?>? publikasi;
  List<PenugasanSection?>? penugasan;

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
    this.profilePicture,
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
    return _empty ??= User(name: "");
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
      profilePicture: profilePicture,
      roleType: roleType,
      dob: dob,
      address: address,
      agama: agama,
      password: password,
      schoolId: schoolId,
      kontak: kontak,
      pelatihan: pelatihan,
      pendidikan: pendidikan,
      penugasan: penugasan,
      publikasi: publikasi,
    );
  }

  static User? fromMap(Map<String, dynamic>? data) {
    // data!["kontak"] = data["kontak"].map((e) => jsonDecode(e)).toList();
    // data["pelatihan"] = data["pelatihan"].map((e) => jsonDecode(e)).toList();
    // data["pendidikan"] = data["pendidikan"].map((e) => jsonDecode(e)).toList();
    // data["penugasan"] = data["penugasan"].map((e) => jsonDecode(e)).toList();
    // data["publikasi"] = data["publikasi"].map((e) => jsonDecode(e)).toList();
    return data == null
        ? null
        : User(
            id: data["id"] ?? "",
            name: data["name"] ?? "",
            nik: data["nik"] ?? "",
            email: data["email"] ?? "",
            profilePicture: data["profilePicture"] ?? "",
            handPhone: data["handPhone"] ?? "",
            userType: EnumParser.getEnum(
                UserType.values, data["userType"] ?? "Member"),
            roleType:
                EnumParser.getEnum(RoleType.values, data["roleType"] ?? "Guru"),
            dob: DateTime.tryParse(data["dob"] ?? ""),
            address: data["address"],
            agama: data["agama"],
            password: data["password"],
            schoolId: data["schoolId"],
            kontak: KontakSection.fromMapList(data["kontak"]),
            pelatihan: PelatihanSection.fromMapList(data["pelatihan"]),
            pendidikan: PendidikanSection.fromMapList(data["pendidikan"]),
            penugasan: PenugasanSection.fromMapList(data["penugasan"]),
            publikasi: PublikasiSection.fromMapList(data["publikasi"]),
          );
  }

  static List<User?> fromMapList(List<dynamic>? data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "name": name,
      "nik": nik,
      "profilePicture": profilePicture,
      "email": email,
      "handPhone": handPhone,
      "schoolId": schoolId,
      "userType": EnumParser.getString(userType),
      "roleType": EnumParser.getString(roleType),
      "dob": dob?.toIso8601String(),
      "address": address,
      "agama": agama,
      "password": password,
      "kontak": kontak?.map<Map<String, dynamic>>((e) {
            var map = e!.toVariables();
            return map;
          }).toList() ??
          [],
      "pelatihan": pelatihan?.map<Map<String, dynamic>>((e) {
            var map = e!.toVariables();
            return map;
          }).toList() ??
          [],
      "pendidikan": pendidikan?.map<Map<String, dynamic>>((e) {
            var map = e!.toVariables();
            return map;
          }).toList() ??
          [],
      "penugasan": penugasan?.map<Map<String, dynamic>>((e) {
            var map = e!.toVariables();
            return map;
          }).toList() ??
          [],
      "publikasi": publikasi?.map<Map<String, dynamic>>((e) {
            var map = e!.toVariables();
            return map;
          }).toList() ??
          [],
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
