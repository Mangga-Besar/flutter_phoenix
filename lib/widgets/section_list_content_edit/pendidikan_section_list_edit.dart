import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/link_text_span.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';
import 'package:provider/provider.dart';

class PendidikanSectionListEdit extends SectionList {
  PendidikanSectionListEdit({required this.pendidikan, super.key});
  PendidikanSection pendidikan;

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
                  arguments: {"content": pendidikan},
                );
              },
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              pendidikan.jurusan ?? "",
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
            CustomText(
              pendidikan.tahun?.year.toString() ?? "",
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            CustomText(
              EnumParser.getString(pendidikan.level),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            CustomText(
              pendidikan.lokasi ?? "",
              fontSize: 12,
              color: Colors.black87,
            ),
            CustomText(
              pendidikan.description ?? "",
              fontSize: 12,
              color: Colors.black87,
            ),
            const CustomText(
              "Link Terkait :",
              fontSize: 12,
              color: Colors.black87,
            ),
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
                      text: "Link #${index.toString()}",
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
