import 'package:flutter/material.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';

class PelatihanSectionListEdit extends SectionList {
  PelatihanSectionListEdit({required this.pelatihan, super.key});
  PelatihanSection pelatihan;

  @override
  Widget getContent(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              pelatihan.name ?? "",
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
            CustomText(
              pelatihan.topik ?? "",
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            CustomText(
              pelatihan.pemberiSertifikat ?? "",
              fontSize: 12,
              color: Colors.black87,
            ),
            CustomText(
              "Dimulai : " +
                  (pelatihan.startDate?.month.toString() ?? "") +
                  " - " +
                  (pelatihan.startDate?.year.toString() ?? ""),
              fontSize: 12,
              color: Colors.black87,
            ),
            CustomText(
              "Berakhir : " +
                  (pelatihan.endDate?.month.toString() ?? "") +
                  " - " +
                  (pelatihan.endDate?.year.toString() ?? ""),
              fontSize: 12,
              color: Colors.black87,
            ),
            CustomText(
              pelatihan.description ?? "",
              fontSize: 12,
              color: Colors.black87,
            ),
          ],
        ),
      ],
    );
  }
}
