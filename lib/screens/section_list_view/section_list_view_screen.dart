import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/screens/base_screen.dart';
import 'package:flutter_phoenix/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/screens/home/home_page.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_kontak_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_pelatihan_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_pendidikan_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_penugasan_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_publikasi_edit_page.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_user_edit_page.dart';
import 'package:flutter_phoenix/screens/section_list_view/section_list_view_page.dart';
import 'package:flutter_phoenix/widgets/home_drawer.dart';
import 'package:provider/provider.dart';

class SectionListViewScreen extends BaseScreenWithAppBar {
  SectionListViewScreen()
      : super(
          "SectionListView",
          PageName.SectionList,
          scrollable: false,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return SectionListViewPage(
      content: args["content"],
    );
  }

  @override
  Widget? drawer(BuildContext context) {
    return null;
  }

  @override
  AppBar? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      elevation: 0,
      actions: [
        Builder(builder: (context) {
          Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          var content = args["content"];
          String tipe;

          tipe = content[0].ofType();

          if (tipe == "Kontak") {
            return ChangeNotifierProvider<KontakSection>(
              create: (context) => KontakSection.empty(),
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return SectionKontakEditPage();
                      },
                    ));
                  }),
            );
          } else if (tipe == "Pelatihan") {
            return ChangeNotifierProvider<PelatihanSection>(
              create: (context) => PelatihanSection.empty(),
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return SectionPelatihanEditPage();
                      },
                    ));
                  }),
            );
          } else if (tipe == "Pendidikan") {
            return ChangeNotifierProvider<PendidikanSection>(
              create: (context) => PendidikanSection.empty(),
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return SectionPendidikanEditPage();
                      },
                    ));
                  }),
            );
          } else if (tipe == "Penugasan") {
            return ChangeNotifierProvider<PenugasanSection>(
              create: (context) => PenugasanSection.empty(),
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return SectionPenugasanEditPage();
                      },
                    ));
                  }),
            );
          } else if (tipe == "Publikasi") {
            return ChangeNotifierProvider<PublikasiSection>(
              create: (context) => PublikasiSection.empty(),
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return SectionPublikasiEditPage();
                      },
                    ));
                  }),
            );
          } else {
            return Container();
          }
        })
      ],
    );
  }
}
