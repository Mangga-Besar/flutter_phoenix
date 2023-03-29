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
import 'package:provider/provider.dart';

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
      return ChangeNotifierProvider<User>.value(
        value: (content as User),
        child: SectionUserEditPage(),
      );
    }

    if (tipe == "Kontak") {
      return ChangeNotifierProvider<KontakSection>.value(
        value: (content as KontakSection),
        child: SectionKontakEditPage(),
      );
    } else if (tipe == "Pelatihan") {
      return ChangeNotifierProvider<PelatihanSection>.value(
          value: (content as PelatihanSection),
          child: SectionPelatihanEditPage());
    } else if (tipe == "Pendidikan") {
      return ChangeNotifierProvider<PendidikanSection>.value(
        value: (content as PendidikanSection),
        child: SectionPendidikanEditPage(),
      );
    } else if (tipe == "Penugasan") {
      return ChangeNotifierProvider<PenugasanSection>.value(
        value: (content as PenugasanSection),
        child: SectionPenugasanEditPage(),
      );
    } else if (tipe == "Publikasi") {
      return ChangeNotifierProvider<PublikasiSection>.value(
        value: (content as PublikasiSection),
        child: SectionPublikasiEditPage(),
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
