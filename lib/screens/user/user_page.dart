import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/enums/pendidikan_level.dart';
import 'package:flutter_phoenix/enums/role_type.dart';
import 'package:flutter_phoenix/enums/user_type.dart';
import 'package:flutter_phoenix/functions/date_parser.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/functions/token_version.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/picture_factory.dart';
import 'package:flutter_phoenix/widgets/section_part.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key, required this.user});
  User user;
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                          clipBehavior: Clip.hardEdge,
                          child: Container(
                              height: 125,
                              width: 125,
                              child: PictureFactory.build(
                                  widget.user.profilePicture ?? "",
                                  padding: EdgeInsets.zero,
                                  fit: BoxFit.contain)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          widget.user.name ?? "",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          widget.user.email ?? "",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          widget.user.nik ?? "",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          widget.user.handPhone ?? "",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          DateParser.parseDateOnly(
                              widget.user.dob ?? DateTime.now()),
                          fontSize: 15,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          widget.user.address ?? "",
                          color: Colors.black54,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                        CustomText(
                          widget.user.agama ?? "",
                          color: Colors.black54,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SectionPart(
                    title: "KONTAK DARURAT",
                    user: widget.user,
                    content: widget.user.kontak ?? <KontakSection>[],
                  ),
                  SectionPart(
                    title: "PENDIDIKAN",
                    user: widget.user,
                    content: widget.user.pendidikan ?? <PendidikanSection>[],
                  ),
                  SectionPart(
                    title: "PELATIHAN",
                    user: widget.user,
                    content: widget.user.pelatihan ?? <PelatihanSection>[],
                  ),
                  SectionPart(
                    title: "PUBLIKASI",
                    user: widget.user,
                    content: widget.user.publikasi ?? <PublikasiSection>[],
                  ),
                  SectionPart(
                    title: "PENUGASAN",
                    user: widget.user,
                    content: widget.user.penugasan ?? <PenugasanSection>[],
                  ),
                ],
              ),
              Positioned(
                right: 10,
                top: 15,
                child: IconButton(
                  onPressed: () async {
                    await Routes.push(context, PageName.EditSection,
                        arguments: {
                          "content": widget.user,
                        });
                    setState(() {
                      super.setState(() {});
                    });
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
