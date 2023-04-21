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
          PageName.SectionListView,
          scrollable: false,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    User user = args["user"];
    Type type = args["type"] as Type;
    return Consumer<User>(builder: (_, target, __) {
      return SectionListViewPage(
        target: target,
        user: user,
        type: type,
      );
    });
  }

  @override
  Widget? drawer(BuildContext context) {
    return null;
  }

  @override
  Widget? floatingActionButton(BuildContext context) {
    return Consumer<User>(builder: (_, target, __) {
      Map<String, dynamic> args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

      User user = args["user"];
      Type type = args["type"] as Type;
      return (user.isCommitee || user.isSuper || user.id == target.id)
          ? Builder(
              builder: (context) {
                if (type == KontakSection) {
                  return ChangeNotifierProvider<KontakSection>(
                    create: (context) => KontakSection(),
                    child: FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SectionEditScreen();
                              },
                              settings: RouteSettings(arguments: {
                                "content": KontakSection(),
                                "user": target,
                                "type": type,
                                "new": KontakSection()
                              }),
                            ),
                          );
                        }),
                  );
                } else if (type == PelatihanSection) {
                  return ChangeNotifierProvider<PelatihanSection>(
                    create: (context) => PelatihanSection(),
                    child: FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SectionEditScreen();
                              },
                              settings: RouteSettings(arguments: {
                                "content": PelatihanSection(),
                                "user": target,
                                "type": type,
                              }),
                            ),
                          );
                        }),
                  );
                } else if (type == PendidikanSection) {
                  return ChangeNotifierProvider<PendidikanSection>(
                    create: (context) => PendidikanSection(),
                    child: FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SectionEditScreen();
                              },
                              settings: RouteSettings(arguments: {
                                "content": PendidikanSection(),
                                "user": target,
                                "type": type,
                              }),
                            ),
                          );
                        }),
                  );
                } else if (type == PenugasanSection) {
                  return ChangeNotifierProvider<PenugasanSection>(
                    create: (context) => PenugasanSection(),
                    child: FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SectionEditScreen();
                              },
                              settings: RouteSettings(arguments: {
                                "content": PenugasanSection(),
                                "user": target,
                                "type": type,
                              }),
                            ),
                          );
                        }),
                  );
                } else if (type == PublikasiSection) {
                  return ChangeNotifierProvider<PublikasiSection>(
                    create: (context) => PublikasiSection(),
                    child: FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SectionEditScreen();
                              },
                              settings: RouteSettings(arguments: {
                                "content": PublikasiSection(),
                                "user": target,
                                "type": type,
                              }),
                            ),
                          );
                        }),
                  );
                } else {
                  return Container();
                }
              },
            )
          : Container();
    });
  }
}
