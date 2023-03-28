import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';

class PenugasanSectionListEdit extends SectionList {
  PenugasanSectionListEdit({required this.penugasan, super.key});
  PenugasanSection penugasan;

  @override
  Widget getContent(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Routes.push(
                context,
                PageName.EditSection,
                arguments: {"content": penugasan},
              );
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              penugasan.name ?? "",
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
            CustomText(
              penugasan.tipePekerjaan ?? "",
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
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
            CustomText(
              penugasan.description ?? "",
              fontSize: 12,
              color: Colors.black87,
            ),
          ],
        ),
      ],
    );
  }
}
