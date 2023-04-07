import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
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
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    ISection? content = args["content"];
    User user = args["user"] ?? content;
    String tipe;
    try {
      tipe = content?.ofType() ?? "";
    } catch (e) {
      return ChangeNotifierProvider<User>.value(
        value: (content as User),
        child: SectionUserEditPage(),
      );
    }

    if (tipe == "Kontak") {
      return ChangeNotifierProvider<User>.value(
        value: user,
        child: ChangeNotifierProvider<KontakSection>.value(
          value: (content as KontakSection),
          child: SectionKontakEditPage(),
        ),
      );
    } else if (tipe == "Pelatihan") {
      return ChangeNotifierProvider<User>.value(
        value: user,
        child: ChangeNotifierProvider<PelatihanSection>.value(
            value: (content as PelatihanSection),
            child: SectionPelatihanEditPage()),
      );
    } else if (tipe == "Pendidikan") {
      return ChangeNotifierProvider<User>.value(
        value: user,
        child: ChangeNotifierProvider<PendidikanSection>.value(
          value: (content as PendidikanSection),
          child: SectionPendidikanEditPage(),
        ),
      );
    } else if (tipe == "Penugasan") {
      return ChangeNotifierProvider<User>.value(
        value: user,
        child: ChangeNotifierProvider<PenugasanSection>.value(
          value: (content as PenugasanSection),
          child: SectionPenugasanEditPage(),
        ),
      );
    } else if (tipe == "Publikasi") {
      return ChangeNotifierProvider<User>.value(
        value: user,
        child: ChangeNotifierProvider<PublikasiSection>.value(
          value: (content as PublikasiSection),
          child: SectionPublikasiEditPage(),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  AppBar appBar(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    ISection content = args["content"];
    User user = args["user"];
    return AppBar(
      title: const CustomText("EDIT", fontSize: 20),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
            onPressed: () {
              if (content is KontakSection) {
                user.kontak!.remove(content);
              } else if (content is PendidikanSection) {
                user.pendidikan!.remove(content);
              } else if (content is PelatihanSection) {
                user.pelatihan!.remove(content);
              } else if (content is PenugasanSection) {
                user.penugasan!.remove(content);
              } else if (content is PublikasiSection) {
                user.publikasi!.remove(content);
              }
              user.notifyListeners();
              UserHelper().updateUser(user.id ?? "", user);
              Routes.pop(context);
            },
            icon: Icon(Icons.delete))
      ],
    );
  }

  @override
  Widget? drawer(BuildContext context) {
    return null;
  }
}
