import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';

class KontakSection with ChangeNotifier implements ISection {
  KontakSection(
      {this.description, this.contactNumber, this.hubungan, this.name});

  static KontakSection? _empty;

  static KontakSection empty() {
    return _empty ??= KontakSection(name: "EMPTY");
  }

  @override
  String? description;

  @override
  String? name;

  String? hubungan;

  int? contactNumber;

  @override
  String? ofType() {
    return "Kontak";
  }

  String? nameValidator() {
    return name!.isEmpty ? "Nama Lengkap tidak boleh kosong" : null;
  }

  @override
  ISection? copy() {
    return KontakSection(
      name: name,
      contactNumber: contactNumber,
      description: description,
      hubungan: hubungan,
    );
  }

  Map<String, dynamic> toVariables() {
    return {
      "name": name,
      "contactNumber": contactNumber,
      "description": description,
      "hubungan": hubungan,
    };
  }

  static KontakSection? fromMap(Map<String, dynamic>? data) {
    return data == null
        ? null
        : KontakSection(
            name: data["name"] ?? "",
            contactNumber: data["contactNumber"] ?? "",
            description: data["description"] ?? "",
            hubungan: data["hubungan"] ?? "",
          );
  }

  static List<KontakSection?> fromMapList(List<dynamic>? data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }
}
