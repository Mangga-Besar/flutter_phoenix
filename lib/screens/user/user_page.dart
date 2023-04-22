import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/date_parser.dart';
import 'package:flutter_phoenix/functions/routes.dart';
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
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key, required this.target});
  User target;
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
          child: UserBuilder(builder: (user) {
            return ChangeNotifierProvider.value(
                value: widget.target,
                builder: (context, _) {
                  return Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(200)),
                                    clipBehavior: Clip.hardEdge,
                                    child: Container(
                                        height: 200,
                                        width: 200,
                                        child: PictureFactory.build(
                                            widget.target.profilePicture ?? "",
                                            padding: EdgeInsets.zero,
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    widget.target.name ?? "",
                                    textAlign: TextAlign.center,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    widget.target.email ?? "",
                                    fontSize: 15,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  // CustomText(
                                  //   ((widget.target.isCommitee ||
                                  //           widget.target.isSuper))
                                  //       ? ("${widget.target.nik?.substring(0, 4) ?? ""}******")
                                  //       : widget.target.nik ?? "",
                                  //   fontSize: 15,
                                  //   fontWeight: FontWeight.w500,
                                  // ),
                                  CustomText(
                                    ((user!.isCommitee || user.isSuper))
                                        ? widget.target.handPhone ?? ""
                                        : ("${widget.target.handPhone?.substring(0, widget.target.handPhone!.length - 5) ?? ""}*****"),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    DateParser.parseDateOnly(
                                        widget.target.dob ?? DateTime.now()),
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                    widget.target.address ?? "",
                                    color: Colors.black54,
                                    fontWeight: FontWeight.normal,
                                    textAlign: TextAlign.center,
                                    fontSize: 15,
                                  ),
                                  CustomText(
                                    widget.target.agama ?? "",
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
                          ),
                          SectionPart(
                            title: "KONTAK DARURAT",
                            user: user,
                            type: KontakSection,
                          ),
                          SectionPart(
                            title: "PENDIDIKAN",
                            user: user,
                            type: PendidikanSection,
                          ),
                          SectionPart(
                            title: "PELATIHAN",
                            user: user,
                            type: PelatihanSection,
                          ),
                          SectionPart(
                            title: "PUBLIKASI",
                            user: user,
                            type: PublikasiSection,
                          ),
                          SectionPart(
                            title: "PENUGASAN",
                            user: user,
                            type: PenugasanSection,
                          ),
                        ],
                      ),
                      (user.id == widget.target.id ||
                              user.isSuper ||
                              user.isCommitee)
                          ? Positioned(
                              right: 10,
                              top: 15,
                              child: IconButton(
                                onPressed: () async {
                                  await Routes.push(
                                      context, PageName.EditSection,
                                      arguments: {
                                        "content": widget.target,
                                        "user": user,
                                        "type": User
                                      });
                                  setState(() {
                                    super.setState(() {});
                                  });
                                },
                                icon: const Icon(
                                  Icons.edit,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  );
                });
          }),
        ),
      ),
    );
  }
}
