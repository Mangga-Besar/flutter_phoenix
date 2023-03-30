import 'package:flutter/material.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';

class PelatihanSection with ChangeNotifier implements ISection {
  PelatihanSection({
    this.description,
    this.endDate,
    this.link,
    this.name,
    this.pemberiSertifikat,
    this.startDate,
    this.tag,
    this.topik,
  });

  static PelatihanSection? _empty;
  static PelatihanSection empty() {
    return _empty ??= PelatihanSection(name: "EMPTY");
  }

  @override
  String? description;

  @override
  String? name;
  String? topik;
  List<String>? link;
  List<String>? tag;
  DateTime? startDate;
  DateTime? endDate;
  String? pemberiSertifikat;

  @override
  String? ofType() {
    return "Pelatihan";
  }

  @override
  ISection? copy() {
    return PelatihanSection(
      description: description,
      endDate: endDate,
      link: link,
      name: name,
      pemberiSertifikat: pemberiSertifikat,
      startDate: startDate,
      tag: tag,
      topik: topik,
    );
  }
}
