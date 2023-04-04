import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';
import 'package:provider/provider.dart';

class KontakSectionListEdit extends SectionList {
  KontakSectionListEdit({required this.kontak, required this.user, super.key});
  KontakSection kontak;
  User user;
  @override
  Widget getContent(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: ChangeNotifierProvider.value(
            value: kontak,
            builder: (context, _) => IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Routes.push(
                  context,
                  PageName.EditSection,
                  arguments: {
                    "content": kontak,
                    "user": user,
                  },
                );
              },
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              kontak.name ?? "",
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
            CustomText(
              (kontak.contactNumber ?? "").toString(),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            CustomText(
              kontak.hubungan ?? "",
              fontSize: 12,
              color: Colors.black87,
            ),
            CustomText(
              kontak.description ?? "",
              fontSize: 12,
              color: Colors.black87,
            ),
          ],
        ),
      ],
    );
  }
}
