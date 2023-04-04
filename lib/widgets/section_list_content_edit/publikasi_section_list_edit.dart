import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/link_text_span.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';
import 'package:provider/provider.dart';

class PublikasiSectionListEdit extends SectionList {
  PublikasiSectionListEdit(
      {required this.publikasi, required this.user, super.key});
  PublikasiSection publikasi;
  User user;

  @override
  Widget getContent(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: ChangeNotifierProvider.value(
            value: publikasi,
            builder: (context, _) => IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Routes.push(
                  context,
                  PageName.EditSection,
                  arguments: {
                    "content": publikasi,
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
            const CustomText(
              "Link Terkait :",
              fontSize: 12,
              color: Colors.black87,
            ),
            ListView.builder(
              itemCount: publikasi.link?.length ?? 0,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: RichText(
                    text: LinkTextSpan(
                      text: "Link #${index.toString()}",
                      url: publikasi.link?[index] ?? "",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
