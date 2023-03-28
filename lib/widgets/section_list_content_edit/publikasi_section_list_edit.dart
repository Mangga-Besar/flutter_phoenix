import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';

class PublikasiSectionListEdit extends SectionList {
  PublikasiSectionListEdit({required this.publikasi, super.key});
  PublikasiSection publikasi;

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
                arguments: {"content": publikasi},
              );
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              publikasi.name ?? "",
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
            CustomText(
              publikasi.tanggal?.year.toString() ?? "",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            CustomText(
              publikasi.topik ?? "",
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            CustomText(
              publikasi.description ?? "",
              fontSize: 12,
              color: Colors.black87,
            ),
          ],
        ),
      ],
    );
  }
}
