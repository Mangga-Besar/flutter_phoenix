import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/pendidikan_level.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';

class PendidikanSection with ChangeNotifier implements ISection {
  PendidikanSection({
    this.description,
    this.jurusan,
    this.level,
    this.link,
    this.lokasi,
    this.name,
    this.tahun,
  });
  static PendidikanSection? _empty;
  static PendidikanSection empty() {
    return _empty ??= PendidikanSection(name: "EMPTY");
  }

  @override
  String? description;

  @override
  String? name;

  String? jurusan;

  String? lokasi;
  List<String>? link;
  PendidikanLevel? level;
  DateTime? tahun;

  @override
  String? ofType() {
    return "Pendidikan";
  }

  @override
  ISection? copy() {
    return PendidikanSection(
      description: description,
      jurusan: jurusan,
      level: level,
      link: link,
      lokasi: lokasi,
      name: name,
      tahun: tahun,
    );
  }

  Map<String, dynamic> toVariables() {
    return {
      "name": name,
      "tahun": (tahun ?? DateTime.now()).toIso8601String(),
      "description": description,
      "level": EnumParser.getString(level),
      "lokasi": lokasi,
      "jurusan": jurusan,
      "link": link,
    };
  }

  static PendidikanSection? fromMap(Map<String, dynamic>? data) {
    List<String> link = data?["link"].isEmpty ? <String>[] : data?["link"];

    return data == null
        ? null
        : PendidikanSection(
            name: data["name"] ?? "",
            description: data["description"] ?? "",
            tahun: DateTime.tryParse(data["tahun"]),
            link: link,
            level:
                EnumParser.getEnum(PendidikanLevel.values, data["level"] ?? ""),
            lokasi: data["lokasi"] ?? "",
            jurusan: data["jurusan"] ?? "",
          );
  }

  static List<PendidikanSection?> fromMapList(List<dynamic>? data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }
}
