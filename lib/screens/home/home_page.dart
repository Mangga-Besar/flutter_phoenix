import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
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
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User user;
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
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: FutureBuilder<String>(
          future: TokenVersion.getToken(),
          builder: (context, token) {
            // if (token.data == "") {
            //   Routes.pushReplacement(context, PageName.Login);
            // }
            return UserBuilder(
              builder: (user) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: ChangeNotifierProvider.value(
                    value: user,
                    builder: (context, _) {
                      return SingleChildScrollView(
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(200)),
                                          clipBehavior: Clip.hardEdge,
                                          child: Container(
                                              height: 200,
                                              width: 200,
                                              child: PictureFactory.build(
                                                  user?.profilePicture ?? "",
                                                  padding: EdgeInsets.zero,
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomText(
                                          user!.name ?? "",
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomText(
                                          user.email ?? "",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                        ),
                                        // CustomText(
                                        //   ((user.isCommitee || user.isSuper))
                                        //       ? ("${user.nik?.substring(0, 4) ?? ""}******")
                                        //       : user.nik ?? "",
                                        //   fontSize: 15,
                                        //   fontWeight: FontWeight.w500,
                                        // ),
                                        CustomText(
                                          ((user.isCommitee || user.isSuper))
                                              ? user.nik ?? ""
                                              : ("${user.handPhone?.substring(0, user.handPhone!.length - 4) ?? ""}****"),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomText(
                                          DateParser.parseDateOnly(
                                              user.dob ?? DateTime.now()),
                                          fontSize: 15,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CustomText(
                                          user.address ?? "",
                                          color: Colors.black54,
                                          fontWeight: FontWeight.normal,
                                          textAlign: TextAlign.center,
                                          fontSize: 15,
                                        ),
                                        CustomText(
                                          user.agama ?? "",
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
                            Positioned(
                              right: 10,
                              top: 15,
                              child: IconButton(
                                onPressed: () async {
                                  await Routes.push(
                                      context, PageName.EditSection,
                                      arguments: {
                                        "content": user,
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
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            );
          }),
    );
  }
}
