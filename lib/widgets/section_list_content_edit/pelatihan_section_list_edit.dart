import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/link_text_span.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';
import 'package:provider/provider.dart';

class PelatihanSectionListEdit extends SectionList {
  PelatihanSectionListEdit(
      {required this.pelatihan, required this.target, super.key});
  PelatihanSection pelatihan;
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
                    value: pelatihan,
                    builder: (context, _) => IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Routes.push(
                          context,
                          PageName.EditSection,
                          arguments: {
                            "content": pelatihan,
                            "user": target,
                            "type": PelatihanSection
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
                pelatihan.name ?? "",
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
              CustomText(
                pelatihan.topik ?? "",
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                pelatihan.pemberiSertifikat ?? "",
                fontSize: 12,
                color: Colors.black87,
              ),
              CustomText(
                "Dimulai : ${pelatihan.startDate?.month.toString() ?? ""} - ${pelatihan.startDate?.year.toString() ?? ""}",
                fontSize: 12,
                color: Colors.black87,
              ),
              CustomText(
                "Berakhir : ${pelatihan.endDate?.month.toString() ?? ""} - ${pelatihan.endDate?.year.toString() ?? ""}",
                fontSize: 12,
                color: Colors.black87,
              ),
              CustomText(
                pelatihan.description ?? "",
                fontSize: 12,
                color: Colors.black87,
              ),
              const CustomText(
                "Link Terkait :",
                fontSize: 12,
                color: Colors.black87,
              ),
              ListView.builder(
                itemCount: pelatihan.link?.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.5,
                    ),
                    child: RichText(
                      text: LinkTextSpan(
                        style: const TextStyle(
                          color: Configs.linkColor,
                        ),
                        text: "Link #${(index + 1).toString()}",
                        url: pelatihan.link?[index] ?? "",
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
