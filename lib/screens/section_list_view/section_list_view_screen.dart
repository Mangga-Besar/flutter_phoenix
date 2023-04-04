import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/screens/base_screen.dart';
import 'package:flutter_phoenix/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/screens/section_edit/section_edit_screen.dart';
import 'package:flutter_phoenix/screens/section_list_view/section_list_view_page.dart';
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

    User user = args["user"];

    return SectionListViewPage(
      content: args["content"],
      user: user,
    );
  }

  @override
  Widget? drawer(BuildContext context) {
    return null;
  }

  @override
  AppBar? appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: [
        Builder(builder: (context) {
          Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          List<ISection?> content = args["content"];
          User user = args["user"];

          if (content is List<KontakSection?>) {
            return ChangeNotifierProvider<KontakSection>(
              create: (context) => KontakSection(),
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SectionEditScreen();
                        },
                        settings: RouteSettings(arguments: {
                          "content": KontakSection(),
                          "user": user,
                        }),
                      ),
                    );
                  }),
            );
          } else if (content is List<PelatihanSection?>) {
            return ChangeNotifierProvider<PelatihanSection>(
              create: (context) => PelatihanSection(),
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SectionEditScreen();
                        },
                        settings: RouteSettings(arguments: {
                          "content": PelatihanSection(),
                          "user": user,
                        }),
                      ),
                    );
                  }),
            );
          } else if (content is List<PendidikanSection?>) {
            return ChangeNotifierProvider<PendidikanSection>(
              create: (context) => PendidikanSection(),
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SectionEditScreen();
                        },
                        settings: RouteSettings(arguments: {
                          "content": PendidikanSection(),
                          "user": user,
                        }),
                      ),
                    );
                  }),
            );
          } else if (content is List<PenugasanSection?>) {
            return ChangeNotifierProvider<PenugasanSection>(
              create: (context) => PenugasanSection(),
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SectionEditScreen();
                        },
                        settings: RouteSettings(arguments: {
                          "content": PenugasanSection(),
                          "user": user,
                        }),
                      ),
                    );
                  }),
            );
          } else if (content is List<PublikasiSection?>) {
            return ChangeNotifierProvider<PublikasiSection>(
              create: (context) => PublikasiSection(),
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SectionEditScreen();
                        },
                        settings: RouteSettings(arguments: {
                          "content": PublikasiSection(),
                          "user": user,
                        }),
                      ),
                    );
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
