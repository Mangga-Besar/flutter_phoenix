import 'package:flutter/material.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';

class KontakSectionList extends SectionList {
  KontakSectionList({required this.kontak, super.key});
  KontakSection kontak;
  late String handPhone;

  @override
  Widget getContent(BuildContext context) {
    handPhone = (kontak.contactNumber ?? "").toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kontak.name?.isNotEmpty ?? false
            ? CustomText(
                kontak.name ?? "",
                fontWeight: FontWeight.w800,
                fontSize: 15,
              )
            : Container(),
        handPhone.isNotEmpty
            ? CustomText(
                ("${handPhone.substring(0, handPhone.length - 4)}****"),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              )
            : Container(),
        (kontak.hubungan?.isNotEmpty ?? false)
            ? CustomText(
                kontak.hubungan ?? "",
                fontSize: 12,
                color: Colors.black87,
              )
            : Container(),
        // (kontak.description?.isNotEmpty ?? false)
        //     ? CustomText(
        //         kontak.description ?? "",
        //         fontSize: 12,
        //         color: Colors.black87,
        //       )
        //     : Container(),
      ],
    );
  }
}
