import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              kontak.name ?? "",
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            CustomText(
              (kontak.contactNumber ?? "").toString(),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        CustomText(kontak.hubungan ?? "", fontSize: 12),
        CustomText(
          kontak.description ?? "",
          fontSize: 12,
        ),
      ],
    );
  }
}
