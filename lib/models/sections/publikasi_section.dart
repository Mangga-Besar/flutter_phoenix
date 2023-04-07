import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/pendidikan_level.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';

class PublikasiSection with ChangeNotifier implements ISection {
  PublikasiSection({
    this.bidangIlmu,
    this.description,
    this.link,
    this.name,
    // this.tag,
    this.tanggal,
    this.topik,
  });
  static PublikasiSection? _empty;
  static PublikasiSection empty() {
    return _empty ??= PublikasiSection(name: "EMPTY");
  }

  @override
  String? description;

  @override
  String? name;
  String? topik;
  String? bidangIlmu;
  List<String>? link = [];
  // List<String>? tag;
  DateTime? tanggal;

  @override
  String? ofType() {
    return "Publikasi";
  }

  @override
  ISection? copy() {
    return PublikasiSection(
      bidangIlmu: bidangIlmu,
      description: description,
      link: link,
      name: name,
      // tag: tag,
      tanggal: tanggal,
      topik: topik,
    );
  }

  Map<String, dynamic> toVariables() {
    return {
      "name": name,
      "tanggal": (tanggal ?? DateTime.now()).toIso8601String(),
      "bidangIlmu": bidangIlmu,
      "description": description,
      // "tag": tag,
      "topik": topik,
      "link": link,
    };
  }

  static PublikasiSection? fromMap(Map<String, dynamic>? data) {
    List<String> link =
        data?["link"].isEmpty ? <String>[] : data!["link"].cast<String>();

    return data == null
        ? null
        : PublikasiSection(
            name: data["name"] ?? "",
            description: data["description"] ?? "",
            tanggal: DateTime.tryParse(data["tanggal"]),
            // tag: data["tag"] ?? "",
            topik: data["topik"] ?? "",
            link: link,
            bidangIlmu: data["bidangIlmu"] ?? "",
          );
  }

  static List<PublikasiSection?> fromMapList(List<dynamic>? data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }
}
