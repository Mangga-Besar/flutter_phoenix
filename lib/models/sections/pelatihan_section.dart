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

  Map<String, dynamic> toVariables() {
    return {
      "name": name,
      "endDate": (endDate ?? DateTime.now()).toIso8601String(),
      "startDate": (startDate ?? DateTime.now()).toIso8601String(),
      "description": description,
      "pemberiSertifikat": pemberiSertifikat,
      "tag": tag,
      "topik": topik,
      "link": link,
    };
  }

  static PelatihanSection? fromMap(Map<String, dynamic>? data) {
    return data == null
        ? null
        : PelatihanSection(
            name: data["name"] ?? "",
            description: data["description"] ?? "",
            endDate: DateTime.tryParse(data["endDate"]),
            startDate: DateTime.tryParse(data["startDate"]),
            pemberiSertifikat: data["pemberiSertifikat"] ?? "",
            link: data["link"] ?? "",
            tag: data["tag"] ?? "",
            topik: data["topik"] ?? "",
          );
  }

  static List<PelatihanSection?> fromMapList(List<dynamic>? data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }
}
