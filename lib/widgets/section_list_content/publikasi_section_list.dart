import 'package:flutter/material.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';

class PublikasiSectionList extends SectionList {
  PublikasiSectionList({required this.publikasi, super.key});
  PublikasiSection publikasi;

  @override
  Widget getContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        publikasi.name?.isNotEmpty ?? false
            ? CustomText(
                "${publikasi.name ?? ''} - (${publikasi.tanggal?.year.toString() ?? ''})",
                fontWeight: FontWeight.w800,
                fontSize: 15,
              )
            : Container(),
        publikasi.topik?.isNotEmpty ?? false
            ? CustomText(
                publikasi.topik ?? "",
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              )
            : Container(),
        publikasi.description?.isNotEmpty ?? false
            ? CustomText(
                publikasi.description ?? "",
                fontSize: 12,
                color: Colors.black87,
              )
            : Container(),
      ],
    );
  }
}
