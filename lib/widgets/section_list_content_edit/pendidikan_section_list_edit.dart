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
              pendidikan.name?.isNotEmpty ?? false
                  ? CustomText(
                      "${EnumParser.getString(pendidikan.level)} - ${pendidikan.name ?? ""} (${pendidikan.tahun?.year.toString()})",
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    )
                  : Container(),
              pendidikan.jurusan?.isNotEmpty ?? false
                  ? CustomText(
                      pendidikan.jurusan ?? "",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    )
                  : Container(),
              pendidikan.description?.isNotEmpty ?? false
                  ? CustomText(
                      pendidikan.description ?? "",
                      fontSize: 12,
                      color: Colors.black87,
                    )
                  : Container(),
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
