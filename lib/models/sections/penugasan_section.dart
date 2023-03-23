import 'package:flutter_phoenix/interfaces/i_section.dart';

class PenugasanSection implements ISection {
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
}
