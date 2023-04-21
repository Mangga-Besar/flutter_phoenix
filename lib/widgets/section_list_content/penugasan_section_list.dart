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
        penugasan.name?.isNotEmpty ?? false
            ? CustomText(
                penugasan.name ?? "",
                fontWeight: FontWeight.w800,
                fontSize: 15,
              )
            : Container(),
        penugasan.tipePekerjaan?.isNotEmpty ?? false
            ? CustomText(
                penugasan.tipePekerjaan ?? "",
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )
            : Container(),
        CustomText(
          "Dimulai : " +
              (penugasan.startDate?.month.toString() ?? "") +
              " - " +
              (penugasan.startDate?.year.toString() ?? ""),
          fontSize: 12,
          color: Colors.black87,
        ),
        CustomText(
          "Berakhir : " +
              (penugasan.endDate?.month.toString() ?? "") +
              " - " +
              (penugasan.endDate?.year.toString() ?? ""),
          fontSize: 12,
          color: Colors.black87,
        ),
        penugasan.description?.isNotEmpty ?? false
            ? CustomText(
                penugasan.description ?? "",
                fontSize: 12,
                color: Colors.black87,
              )
            : Container(),
      ],
    );
  }
}
