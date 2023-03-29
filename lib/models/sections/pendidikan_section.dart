import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/pendidikan_level.dart';
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
}
