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
    Type type = args["type"];

    if (type == KontakSection) {
      return ChangeNotifierProvider<User>.value(
        value: user,
        child: ChangeNotifierProvider<KontakSection>.value(
          value: ((content ?? KontakSection()) as KontakSection),
          child: SectionKontakEditPage(),
        ),
      );
    } else if (type == PelatihanSection) {
      return ChangeNotifierProvider<User>.value(
        value: user,
        child: ChangeNotifierProvider<PelatihanSection>.value(
            value: ((content ?? PelatihanSection()) as PelatihanSection),
            child: SectionPelatihanEditPage()),
      );
    } else if (type == PendidikanSection) {
      return ChangeNotifierProvider<User>.value(
        value: user,
        child: ChangeNotifierProvider<PendidikanSection>.value(
          value: ((content ?? PendidikanSection()) as PendidikanSection),
          child: SectionPendidikanEditPage(),
        ),
      );
    } else if (type == PenugasanSection) {
      return ChangeNotifierProvider<User>.value(
        value: user,
        child: ChangeNotifierProvider<PenugasanSection>.value(
          value: ((content ?? PenugasanSection()) as PenugasanSection),
          child: SectionPenugasanEditPage(),
        ),
      );
    } else if (type == PublikasiSection) {
      return ChangeNotifierProvider<User>.value(
        value: user,
        child: ChangeNotifierProvider<PublikasiSection>.value(
          value: ((content ?? PublikasiSection()) as PublikasiSection),
          child: SectionPublikasiEditPage(),
        ),
      );
    } else if (type == User) {
      return ChangeNotifierProvider<User>.value(
        value: ((content ?? User()) as User),
        child: SectionUserEditPage(),
      );
    } else {
      return Container();
    }
  }

  @override
  AppBar appBar(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Object? content = args["content"];
    Type type = args["type"];
    User user;
    if (content is User) {
      user = content as User;
    } else {
      user = args["user"];
    }
    return AppBar(
      title: const CustomText("EDIT", fontSize: 20),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        content != null &&
                (type == KontakSection ||
                    type == PendidikanSection ||
                    type == PelatihanSection ||
                    type == PenugasanSection ||
                    type == PublikasiSection)
            ? IconButton(
                onPressed: () {
                  if (type == KontakSection) {
                    user.kontak!.remove(content);
                  } else if (type == PendidikanSection) {
                    user.pendidikan!.remove(content);
                  } else if (type == PelatihanSection) {
                    user.pelatihan!.remove(content);
                  } else if (type == PenugasanSection) {
                    user.penugasan!.remove(content);
                  } else if (type == PublikasiSection) {
                    user.publikasi!.remove(content);
                  }
                  user.notifyListeners();
                  UserHelper().updateUser(user.id ?? "", user);
                  Routes.pop(context);
                },
                icon: Icon(Icons.delete))
            : Container()
      ],
    );
  }

  @override
  Widget? drawer(BuildContext context) {
    return null;
  }
}
