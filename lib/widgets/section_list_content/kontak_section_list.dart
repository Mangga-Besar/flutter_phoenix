import 'package:flutter/material.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';

class KontakSectionList extends SectionList {
  KontakSectionList({required this.kontak, super.key});
  KontakSection kontak;

  @override
  Widget getContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          kontak.name ?? "",
          fontWeight: FontWeight.w800,
          fontSize: 15,
        ),
        CustomText(
          (kontak.contactNumber ?? "").toString(),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        CustomText(
          kontak.hubungan ?? "",
          fontSize: 12,
          color: Colors.black87,
        ),
        CustomText(
          kontak.description ?? "",
          fontSize: 12,
          color: Colors.black87,
        ),
      ],
    );
  }
}
