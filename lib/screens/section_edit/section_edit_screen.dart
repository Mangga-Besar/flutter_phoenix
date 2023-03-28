import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/basics/screens/base_screen.dart';
import 'package:flutter_phoenix/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/screens/section_edit/section_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/section_kontak_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/section_pelatihan_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/section_pendidikan_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/section_penugasan_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/section_publikasi_edit_page.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/section_list.dart';

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

    ISection content = args["content"];

    if (content.ofType() == "Kontak") {
      return SectionKontakEditPage(
        kontak: (content as KontakSection),
      );
    } else if (content.ofType() == "Pelatihan") {
      return SectionPelatihanEditPage(
        pelatihan: (content as PelatihanSection),
      );
    } else if (content.ofType() == "Pendidikan") {
      return SectionPendidikanEditPage(
        pendidikan: (content as PendidikanSection),
      );
    } else if (content.ofType() == "Penugasan") {
      return SectionPenugasanEditPage(
        penugasan: (content as PenugasanSection),
      );
    } else if (content.ofType() == "Publikasi") {
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
