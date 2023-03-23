import 'package:flutter/material.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';

class PelatihanSectionList extends SectionList {
  PelatihanSectionList({required this.pelatihan, super.key});
  PelatihanSection pelatihan;

  @override
  Widget getContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          pelatihan.name ?? "",
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        CustomText(
          pelatihan.topik ?? "",
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        CustomText(
          pelatihan.pemberiSertifikat ?? "",
          fontSize: 12,
        ),
        CustomText(
          "Dimulai : " + pelatihan.startDate.toString(),
          fontSize: 12,
        ),
        CustomText(
          "Berakhir : " + pelatihan.endDate.toString(),
          fontSize: 12,
        ),
        CustomText(
          pelatihan.description ?? "",
          fontSize: 12,
        ),
      ],
    );
  }
}
