import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';

class PenugasanSection with ChangeNotifier implements ISection {
  PenugasanSection(
      {this.description,
      this.endDate,
      this.name,
      this.startDate,
      this.tag,
      this.tipePekerjaan});

  static PenugasanSection? _empty;
  static PenugasanSection empty() {
    return _empty ??= PenugasanSection(name: "EMPTY");
  }

  @override
  String? description;

  @override
  String? name;
  List<String>? tag;
  DateTime? startDate;
  DateTime? endDate;
  String? tipePekerjaan;

  @override
  String? ofType() {
    return "Penugasan";
  }

  @override
  ISection? copy() {
    return PenugasanSection(
      description: description,
      endDate: endDate,
      name: name,
      startDate: startDate,
      tag: tag,
      tipePekerjaan: tipePekerjaan,
    );
  }

  Map<String, dynamic> toVariables() {
    return {
      "name": name,
      "startDate": (startDate ?? DateTime.now()).toIso8601String(),
      "endDate": (endDate ?? DateTime.now()).toIso8601String(),
      "description": description,
      "tipePekerjaan": tipePekerjaan,
      "tag": tag,
    };
  }

  static PenugasanSection? fromMap(Map<String, dynamic>? data) {
    return data == null
        ? null
        : PenugasanSection(
            name: data["name"] ?? "",
            description: data["description"] ?? "",
            startDate: DateTime.tryParse(data["startDate"]),
            endDate: DateTime.tryParse(data["endDate"]),
            tag: data["tag"] ?? [],
            tipePekerjaan: data["tipePekerjaan"] ?? "",
          );
  }

  static List<PenugasanSection?> fromMapList(List<dynamic>? data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }
}
