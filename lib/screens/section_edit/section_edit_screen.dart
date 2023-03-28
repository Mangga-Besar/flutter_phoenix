import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_kontak_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_pelatihan_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_pendidikan_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_penugasan_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_publikasi_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_user_edit_page.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';

class SectionEditScreen extends BaseScreenWithAppBar {
  SectionEditScreen()
      : super(
          "REGISTER",
          PageName.EditSection,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    var content = args["content"];
    String tipe;
    try {
      tipe = content.ofType();
    } catch (e) {
      return SectionUserEditPage(
        user: (content as User),
      );
    }

    if (tipe == "Kontak") {
      return SectionKontakEditPage(
        kontak: (content as KontakSection),
      );
    } else if (tipe == "Pelatihan") {
      return SectionPelatihanEditPage(
        pelatihan: (content as PelatihanSection),
      );
    } else if (tipe == "Pendidikan") {
      return SectionPendidikanEditPage(
        pendidikan: (content as PendidikanSection),
      );
    } else if (tipe == "Penugasan") {
      return SectionPenugasanEditPage(
        penugasan: (content as PenugasanSection),
      );
    } else if (tipe == "Publikasi") {
      return SectionPublikasiEditPage(
        publikasi: (content as PublikasiSection),
      );
    } else {
      return Container();
    }
  }

  @override
  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const CustomText("EDIT", fontSize: 20),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  @override
  Widget? drawer(BuildContext context) {
    return null;
  }
}
