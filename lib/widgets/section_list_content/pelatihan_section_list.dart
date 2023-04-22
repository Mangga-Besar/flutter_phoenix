import 'package:flutter/material.dart';
import 'package:flutter_phoenix/functions/date_parser.dart';
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
        pelatihan.name?.isNotEmpty ?? false
            ? CustomText(
                pelatihan.name ?? "",
                fontWeight: FontWeight.w800,
                fontSize: 15,
              )
            : Container(),
        CustomText(
          "(${DateParser.parseDateOnly(pelatihan.startDate!)} - ${DateParser.parseDateOnly(pelatihan.endDate!)})",
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        pelatihan.topik?.isNotEmpty ?? false
            ? CustomText(
                pelatihan.topik ?? "",
                fontSize: 12,
                fontWeight: FontWeight.w500,
              )
            : Container(),
        pelatihan.pemberiSertifikat?.isNotEmpty ?? false
            ? CustomText(
                pelatihan.pemberiSertifikat ?? "",
                fontSize: 12,
                color: Colors.black87,
              )
            : Container(),
        pelatihan.description?.isNotEmpty ?? false
            ? CustomText(
                pelatihan.description ?? "",
                fontSize: 12,
                color: Colors.black87,
              )
            : Container(),
      ],
    );
  }
}
