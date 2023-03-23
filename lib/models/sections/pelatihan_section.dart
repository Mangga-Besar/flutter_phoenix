import 'package:flutter_phoenix/interfaces/i_section.dart';

class PelatihanSection implements ISection {
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
}
