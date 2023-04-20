import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/link_text_span.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';
import 'package:provider/provider.dart';

class PendidikanSectionListEdit extends SectionList {
  PendidikanSectionListEdit(
      {required this.pendidikan, required this.target, super.key});
  PendidikanSection pendidikan;
  User target;

  @override
  Widget getContent(BuildContext context) {
    return UserBuilder(builder: (user) {
      return Stack(
        children: [
          (user!.isCommitee || user.isSuper || user.id == target.id)
              ? Positioned(
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
                            "user": target,
                            "type": PendidikanSection
                          },
                        );
                      },
                    ),
                  ),
                )
              : Container(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                pendidikan.name == "" ? "NULL" : pendidikan.name ?? "",
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
              CustomText(
                pendidikan.tahun?.year.toString() ?? "NULL",
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              pendidikan.jurusan?.isNotEmpty ?? false
                  ? CustomText(
                      pendidikan.jurusan ?? "",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    )
                  : Container(),
              CustomText(
                EnumParser.getString(pendidikan.level),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              CustomText(
                pendidikan.lokasi == "" ? "NULL" : pendidikan.lokasi ?? "",
                fontSize: 12,
                color: Colors.black87,
              ),
              CustomText(
                pendidikan.description == ""
                    ? "NULL"
                    : pendidikan.description ?? "",
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
                      vertical: 2.5,
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
    });
  }
}
