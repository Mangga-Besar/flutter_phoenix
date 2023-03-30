import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/pendidikan_level.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';

class PublikasiSection with ChangeNotifier implements ISection {
  PublikasiSection({
    this.bidangIlmu,
    this.description,
    this.link,
    this.name,
    this.tag,
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
  List<String>? link;
  List<String>? tag;
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
      tag: tag,
      tanggal: tanggal,
      topik: topik,
    );
  }
}
