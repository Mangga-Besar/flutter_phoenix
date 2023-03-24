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
    return Column(
      children: [
        const Divider(
          color: Colors.black87,
          thickness: 5,
        ),
        Padding(
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
                        print("EDIT PROFILE");
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
                  if (widget.content[i].ofType() == "Kontak") {
                    return KontakSectionList(
                        kontak: (widget.content[i]) as KontakSection);
                  }
                  if (widget.content[i].ofType() == "Pendidikan") {
                    return PendidikanSectionList(
                        pendidikan: (widget.content[i]) as PendidikanSection);
                  }
                  if (widget.content[i].ofType() == "Penugasan") {
                    return PenugasanSectionList(
                        penugasan: (widget.content[i]) as PenugasanSection);
                  }
                  if (widget.content[i].ofType() == "Pelatihan") {
                    return PelatihanSectionList(
                        pelatihan: (widget.content[i]) as PelatihanSection);
                  }
                  if (widget.content[i].ofType() == "Publikasi") {
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.transparent),
                        elevation: MaterialStatePropertyAll<double>(0),
                        iconColor:
                            MaterialStatePropertyAll<Color>(Colors.black),
                      ),
                      onPressed: () {
                        Routes.push(
                          context,
                          PageName.SectionList,
                          arguments: {"content": widget.content},
                        );
                      },
                      icon: const Icon(Icons.arrow_drop_down),
                      label: const CustomText("Show More")),
                )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
