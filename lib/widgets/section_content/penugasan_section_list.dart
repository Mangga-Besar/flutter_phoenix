import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';

class PenugasanSectionList extends SectionList {
  PenugasanSectionList({required this.penugasan, super.key});
  PenugasanSection penugasan;

  @override
  Widget getContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              penugasan.name ?? "",
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            CustomText(
              penugasan.tipePekerjaan ?? "",
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        CustomText(
          "Dimulai : " + penugasan.startDate.toString(),
          fontSize: 12,
        ),
        CustomText(
          "Berakhir : " + penugasan.endDate.toString(),
          fontSize: 12,
        ),
        CustomText(
          penugasan.description ?? "",
          fontSize: 12,
        ),
      ],
    );
  }
}
