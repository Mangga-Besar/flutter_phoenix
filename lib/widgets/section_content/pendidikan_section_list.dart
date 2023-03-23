import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';

class PendidikanSectionList extends SectionList {
  PendidikanSectionList({required this.pendidikan, super.key});
  PendidikanSection pendidikan;

  @override
  Widget getContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              pendidikan.jurusan ?? "",
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            CustomText(
              pendidikan.tahun?.year.toString() ?? "",
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        CustomText(
          EnumParser.getString(pendidikan.level),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        CustomText(
          pendidikan.lokasi ?? "",
          fontSize: 12,
        ),
        CustomText(
          pendidikan.description ?? "",
          fontSize: 12,
        ),
      ],
    );
  }
}
