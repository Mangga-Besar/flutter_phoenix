import 'package:flutter/material.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/screens/section_list_view/section_list_view_screen.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list_content/kontak_section_list.dart';
import 'package:flutter_phoenix/widgets/section_list_content/pelatihan_section_list.dart';
import 'package:flutter_phoenix/widgets/section_list_content/pendidikan_section_list.dart';
import 'package:flutter_phoenix/widgets/section_list_content/penugasan_section_list.dart';
import 'package:flutter_phoenix/widgets/section_list_content/publikasi_section_list.dart';
import 'package:provider/provider.dart';

class SectionPart extends StatefulWidget {
  SectionPart({this.title, super.key, required this.user, required this.type});

  Type type;

  User user;
  String? title;

  @override
  State<SectionPart> createState() => _SectionPartState();
}

class _SectionPartState extends State<SectionPart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (_, target, __) {
      int length;
      int showLength;
      if (widget.type == KontakSection) {
        length = (target.kontak?.length ?? 0);
        showLength = length > 4 ? 4 : length;
      } else if (widget.type == PendidikanSection) {
        length = (target.pendidikan?.length ?? 0);
        showLength = length > 4 ? 4 : length;
      } else if (widget.type == PenugasanSection) {
        length = (target.penugasan?.length ?? 0);
        showLength = length > 4 ? 4 : length;
      } else if (widget.type == PelatihanSection) {
        length = (target.pelatihan?.length ?? 0);
        showLength = length > 4 ? 4 : length;
      } else {
        length = (target.publikasi?.length ?? 0);
        showLength = length > 4 ? 4 : length;
      }
      return Column(
        children: [
          const Divider(
            color: Colors.black54,
            thickness: 2,
          ),
          ChangeNotifierProvider<User>.value(
              value: target,
              builder: (context, _) {
                return InkWell(
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) {
                            return ChangeNotifierProvider.value(
                                value: target,
                                builder: (context, _) {
                                  return SectionListViewScreen();
                                });
                          },
                          settings: RouteSettings(
                            arguments: {
                              "user": widget.user,
                              "type": widget.type,
                            },
                          )),
                    );
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 7.5,
                            top: 2.5,
                          ),
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
                                  kontak: (target.kontak?[i]) as KontakSection);
                            }
                            if (widget.type == PendidikanSection) {
                              return PendidikanSectionList(
                                  pendidikan: (target.pendidikan?[i])
                                      as PendidikanSection);
                            }
                            if (widget.type == PenugasanSection) {
                              return PenugasanSectionList(
                                  penugasan: (target.penugasan?[i])
                                      as PenugasanSection);
                            }
                            if (widget.type == PelatihanSection) {
                              return PelatihanSectionList(
                                  pelatihan: (target.pelatihan?[i])
                                      as PelatihanSection);
                            }
                            if (widget.type == PublikasiSection) {
                              return PublikasiSectionList(
                                  publikasi: (target.publikasi?[i])
                                      as PublikasiSection);
                            }
                          },
                          itemCount: showLength,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                        if (length > 4)
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
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      );
    });
  }
}
