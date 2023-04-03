import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list_content/kontak_section_list.dart';
import 'package:flutter_phoenix/widgets/section_list_content/pelatihan_section_list.dart';
import 'package:flutter_phoenix/widgets/section_list_content/pendidikan_section_list.dart';
import 'package:flutter_phoenix/widgets/section_list_content/penugasan_section_list.dart';
import 'package:flutter_phoenix/widgets/section_list_content/publikasi_section_list.dart';
import "package:flutter_phoenix/extensions/string_extensions.dart";

class SectionPart extends StatefulWidget {
  SectionPart({
    this.title,
    super.key,
    required this.content,
  });

  List<ISection> content;

  String? title;

  @override
  State<SectionPart> createState() => _SectionPartState();
}

class _SectionPartState extends State<SectionPart> {
  @override
  Widget build(BuildContext context) {
    String tipe = (widget.title ?? "").capitalize();
    return Column(
      children: [
        const Divider(
          color: Colors.black87,
          thickness: 5,
        ),
        InkWell(
          onTap: () {
            Routes.push(
              context,
              PageName.SectionList,
              arguments: {"content": widget.content},
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomText(
                        widget.title ?? "",
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          Routes.push(
                            context,
                            PageName.SectionList,
                            arguments: {
                              "content":
                                  widget.content.isEmpty ? tipe : widget.content
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                        ),
                      ),
                    )
                  ],
                ),
                ListView.builder(
                  itemBuilder: (context, i) {
                    if (widget.content is List<KontakSection>) {
                      return KontakSectionList(
                          kontak: (widget.content[i]) as KontakSection);
                    }
                    if (widget.content is List<PendidikanSection>) {
                      return PendidikanSectionList(
                          pendidikan: (widget.content[i]) as PendidikanSection);
                    }
                    if (widget.content is List<PenugasanSection>) {
                      return PenugasanSectionList(
                          penugasan: (widget.content[i]) as PenugasanSection);
                    }
                    if (widget.content is List<PelatihanSection>) {
                      return PelatihanSectionList(
                          pelatihan: (widget.content[i]) as PelatihanSection);
                    }
                    if (widget.content is List<PublikasiSection>) {
                      return PublikasiSectionList(
                          publikasi: (widget.content[i]) as PublikasiSection);
                    }
                  },
                  itemCount:
                      widget.content.length > 2 ? 2 : widget.content.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
                if (widget.content.length > 2)
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
        ),
      ],
    );
  }
}
