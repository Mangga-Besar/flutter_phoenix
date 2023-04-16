import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list_content/kontak_section_list.dart';
import 'package:flutter_phoenix/widgets/section_list_content/pelatihan_section_list.dart';
import 'package:flutter_phoenix/widgets/section_list_content/pendidikan_section_list.dart';
import 'package:flutter_phoenix/widgets/section_list_content/penugasan_section_list.dart';
import 'package:flutter_phoenix/widgets/section_list_content/publikasi_section_list.dart';
import "package:flutter_phoenix/extensions/string_extensions.dart";
import 'package:provider/provider.dart';

class SectionPart extends StatefulWidget {
  SectionPart(
      {this.title,
      super.key,
      required this.target,
      required this.user,
      required this.type});

  Type type;
  User target;

  User user;
  String? title;

  @override
  State<SectionPart> createState() => _SectionPartState();
}

class _SectionPartState extends State<SectionPart> {
  @override
  Widget build(BuildContext context) {
    int length;
    if (widget.type == KontakSection) {
      length = ((widget.target.kontak?.length ?? 0) > 2
          ? 2
          : (widget.target.kontak?.length ?? 0));
    } else if (widget.type == PendidikanSection) {
      length = ((widget.target.pendidikan?.length ?? 0) > 2
          ? 2
          : (widget.target.pendidikan?.length ?? 0));
    } else if (widget.type == PenugasanSection) {
      length = ((widget.target.penugasan?.length ?? 0) > 2
          ? 2
          : (widget.target.penugasan?.length ?? 0));
    } else if (widget.type == PelatihanSection) {
      length = ((widget.target.pelatihan?.length ?? 0) > 2
          ? 2
          : (widget.target.pelatihan?.length ?? 0));
    } else {
      length = ((widget.target.publikasi?.length ?? 0) > 2
          ? 2
          : (widget.target.publikasi?.length ?? 0));
    }
    return Column(
      children: [
        const Divider(
          color: Colors.black87,
          thickness: 5,
        ),
        ChangeNotifierProvider<User>.value(
            value: widget.target,
            builder: (context, _) {
              return InkWell(
                onTap: () async {
                  await Routes.push(
                    context,
                    PageName.SectionList,
                    arguments: {
                      "target": widget.target,
                      "user": widget.user,
                      "type": widget.type,
                    },
                  );
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: CustomText(
                          widget.title ?? "",
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                      ListView.builder(
                        itemBuilder: (context, i) {
                          if (widget.type == KontakSection) {
                            return KontakSectionList(
                                kontak: (widget.target.kontak?[i])
                                    as KontakSection);
                          }
                          if (widget.type == PendidikanSection) {
                            return PendidikanSectionList(
                                pendidikan: (widget.target.pendidikan?[i])
                                    as PendidikanSection);
                          }
                          if (widget.type == PenugasanSection) {
                            return PenugasanSectionList(
                                penugasan: (widget.target.penugasan?[i])
                                    as PenugasanSection);
                          }
                          if (widget.type == PelatihanSection) {
                            return PelatihanSectionList(
                                pelatihan: (widget.target.pelatihan?[i])
                                    as PelatihanSection);
                          }
                          if (widget.type == PublikasiSection) {
                            return PublikasiSectionList(
                                publikasi: (widget.target.publikasi?[i])
                                    as PublikasiSection);
                          }
                        },
                        itemCount: length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      ),
                      if (length > 2)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.arrow_drop_down),
                            CustomText(
                              "Show More",
                              fontWeight: FontWeight.w600,
                            )
                          ],
                        ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }
}
