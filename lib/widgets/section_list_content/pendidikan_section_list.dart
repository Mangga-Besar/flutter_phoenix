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
        CustomText(
          pendidikan.jurusan ?? "NULL",
          fontWeight: FontWeight.w800,
          fontSize: 15,
        ),
        CustomText(
          pendidikan.tahun?.year.toString() ?? "NULL",
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        CustomText(
          EnumParser.getString(pendidikan.level),
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        CustomText(
          pendidikan.lokasi ?? "NULL",
          fontSize: 12,
          color: Colors.black87,
        ),
        CustomText(
          pendidikan.description ?? "NULL",
          fontSize: 12,
          color: Colors.black87,
        ),
      ],
    );
  }
}
