import 'package:flutter_phoenix/enums/pendidikan_level.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';

class PublikasiSection implements ISection {
  PublikasiSection({
    this.bidangIlmu,
    this.description,
    this.link,
    this.name,
    this.tag,
    this.tanggal,
    this.topik,
  });

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
}
