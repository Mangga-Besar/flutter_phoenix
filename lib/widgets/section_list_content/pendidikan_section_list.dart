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
        pendidikan.name?.isNotEmpty ?? false
            ? CustomText(
                pendidikan.name ?? "",
                fontWeight: FontWeight.w800,
                fontSize: 15,
              )
            : Container(),
        CustomText(
          pendidikan.tahun?.year.toString() ?? "NULL",
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        pendidikan.jurusan?.isNotEmpty ?? false
            ? CustomText(
                pendidikan.jurusan ?? "",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              )
            : Container(),
        CustomText(
          EnumParser.getString(pendidikan.level),
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        pendidikan.lokasi?.isNotEmpty ?? false
            ? CustomText(
                pendidikan.lokasi ?? "",
                fontSize: 12,
                color: Colors.black87,
              )
            : Container(),
        pendidikan.name?.isNotEmpty ?? false
            ? CustomText(
                pendidikan.description ?? "",
                fontSize: 12,
                color: Colors.black87,
              )
            : Container(),
      ],
    );
  }
}
