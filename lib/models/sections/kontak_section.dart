import 'package:flutter_phoenix/interfaces/i_section.dart';

class KontakSection implements ISection {
  KontakSection(
      {this.description,
      this.contactNumber,
      this.hubungan,
      required this.name});

  @override
  String? description;

  @override
  String? name;

  String? hubungan;

  int? contactNumber;

  @override
  String? ofType() {
    return "Kontak";
  }

  String? nameValidator() {
    return name!.isEmpty ? "Nama Lengkap tidak boleh kosong" : null;
  }
}
