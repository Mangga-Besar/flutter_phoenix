import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';
import 'package:provider/provider.dart';

class PenugasanSectionListEdit extends SectionList {
  PenugasanSectionListEdit(
      {required this.penugasan, required this.target, super.key});
  PenugasanSection penugasan;
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
                    value: penugasan,
                    builder: (context, _) => IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Routes.push(
                          context,
                          PageName.EditSection,
                          arguments: {
                            "content": penugasan,
                            "user": target,
                            "type": PenugasanSection
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
              penugasan.name?.isNotEmpty ?? false
                  ? CustomText(
                      penugasan.name ?? "",
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    )
                  : Container(),
              penugasan.tipePekerjaan?.isNotEmpty ?? false
                  ? CustomText(
                      penugasan.tipePekerjaan ?? "",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )
                  : Container(),
              CustomText(
                "Dimulai : " +
                    (penugasan.startDate?.month.toString() ?? "") +
                    " - " +
                    (penugasan.startDate?.year.toString() ?? ""),
                fontSize: 12,
                color: Colors.black87,
              ),
              CustomText(
                "Berakhir : " +
                    (penugasan.endDate?.month.toString() ?? "") +
                    " - " +
                    (penugasan.endDate?.year.toString() ?? ""),
                fontSize: 12,
                color: Colors.black87,
              ),
              penugasan.description?.isNotEmpty ?? false
                  ? CustomText(
                      penugasan.description ?? "",
                      fontSize: 12,
                      color: Colors.black87,
                    )
                  : Container(),
            ],
          ),
        ],
      );
    });
  }
}
