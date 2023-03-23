import 'package:flutter/material.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';

class PublikasiSectionList extends SectionList {
  PublikasiSectionList({required this.publikasi, super.key});
  PublikasiSection publikasi;

  @override
  Widget getContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              publikasi.name ?? "",
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            CustomText(
              publikasi.tanggal?.year.toString() ?? "",
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ],
        ),
        CustomText(
          publikasi.topik ?? "",
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        CustomText(
          publikasi.description ?? "",
          fontSize: 12,
        ),
      ],
    );
  }
}
