import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/link_text_span.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';
import 'package:provider/provider.dart';

class PublikasiSectionListEdit extends SectionList {
  PublikasiSectionListEdit(
      {required this.publikasi, required this.target, super.key});
  PublikasiSection publikasi;
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
                    value: publikasi,
                    builder: (context, _) => IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Routes.push(
                          context,
                          PageName.EditSection,
                          arguments: {
                            "content": publikasi,
                            "user": target,
                            "type": PublikasiSection
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
              publikasi.link?.isNotEmpty ?? false
                  ? const CustomText(
                      "Link Terkait :",
                      fontSize: 12,
                      color: Colors.black87,
                    )
                  : Container(),
              ListView.builder(
                itemCount: publikasi.link?.length ?? 0,
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
    });
  }
}
