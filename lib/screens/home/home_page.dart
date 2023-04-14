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
import 'package:flutter_phoenix/widgets/section_part.dart';

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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomText(
                                    user?.name ?? "",
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await Routes.push(
                                        context, PageName.EditSection,
                                        arguments: {
                                          "content": user,
                                        });
                                    setState(() {
                                      super.setState(() {});
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                  ),
                                ),
                              ],
                            ),
                            CustomText(
                              user?.email ?? "",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              user?.nik ?? "",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              user?.handPhone ?? "",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              DateParser.parseDateOnly(
                                  user?.dob ?? DateTime.now()),
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              user?.address ?? "",
                              color: Colors.black54,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                            CustomText(
                              user?.agama ?? "",
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
                        user: user!,
                        content: user.kontak ?? <KontakSection>[],
                      ),
                      SectionPart(
                        title: "PENDIDIKAN",
                        user: user,
                        content: user.pendidikan ?? <PendidikanSection>[],
                      ),
                      SectionPart(
                        title: "PELATIHAN",
                        user: user,
                        content: user.pelatihan ?? <PelatihanSection>[],
                      ),
                      SectionPart(
                        title: "PUBLIKASI",
                        user: user,
                        content: user.publikasi ?? <PublikasiSection>[],
                      ),
                      SectionPart(
                        title: "PENUGASAN",
                        user: user,
                        content: user.penugasan ?? <PenugasanSection>[],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
