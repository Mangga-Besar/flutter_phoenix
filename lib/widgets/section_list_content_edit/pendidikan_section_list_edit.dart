import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/link_text_span.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';
import 'package:provider/provider.dart';

class PendidikanSectionListEdit extends SectionList {
  PendidikanSectionListEdit(
      {required this.pendidikan, required this.user, super.key});
  PendidikanSection pendidikan;
  User user;

  @override
  Widget getContent(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: ChangeNotifierProvider.value(
            value: pendidikan,
            builder: (context, _) => IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Routes.push(
                  context,
                  PageName.EditSection,
                  arguments: {
                    "content": pendidikan,
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
              pendidikan.name ?? "NULL",
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
            CustomText(
              pendidikan.tahun?.year.toString() ?? "NULL",
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            CustomText(
              pendidikan.jurusan ?? "NULL",
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            CustomText(
              EnumParser.getString(pendidikan.level),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            CustomText(
              pendidikan.lokasi ?? "NULL",
              fontSize: 12,
              color: Colors.black87,
            ),
            CustomText(
              pendidikan.description ?? "NULL",
              fontSize: 12,
              color: Colors.black87,
            ),
            pendidikan.link?.isNotEmpty ?? false
                ? const CustomText(
                    "Link Terkait :",
                    fontSize: 12,
                    color: Colors.black87,
                  )
                : Container(),
            ListView.builder(
              itemCount: pendidikan.link?.length ?? 0,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: RichText(
                    text: LinkTextSpan(
                      style: TextStyle(
                        color: Configs.linkColor,
                      ),
                      text: "Link #${(index + 1).toString()}",
                      url: pendidikan.link?[index] ?? "",
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
