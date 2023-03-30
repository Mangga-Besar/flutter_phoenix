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
}
