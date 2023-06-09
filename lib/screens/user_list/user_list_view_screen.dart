import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/screens/base_screen.dart';
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
import 'package:flutter_phoenix/screens/section_edit/section_edit_screen.dart';
import 'package:flutter_phoenix/screens/section_list_view/section_list_view_page.dart';
import 'package:flutter_phoenix/screens/user_list/user_list_view_page.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/home_drawer.dart';
import 'package:provider/provider.dart';

class UserListViewScreen extends BaseScreenWithAppBar {
  UserListViewScreen()
      : super(
          "UserListView",
          PageName.UserList,
          scrollable: false,
          padding: EdgeInsets.zero,
        );
  @override
  Widget content(BuildContext context) {
    return UserListViewPage();
  }

  @override
  Widget? drawer(BuildContext context) {
    return const HomeDrawer(selected: PageName.UserList);
  }

  @override
  AppBar? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      centerTitle: true,
      title: CustomText(
        "Daftar Profil",
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      // backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Widget? floatingActionButton(BuildContext context) {
    // TODO: implement floatingActionButton
    return UserBuilder(builder: (user) {
      if (user!.isCommitee || user.isSuper) {
        return FloatingActionButton(
          onPressed: () async {
            await Routes.push(
              context,
              PageName.EditSection,
              arguments: {"content": User.empty().copy(), "type": User},
            );
          },
          child: Icon(Icons.add),
        );
      }
      return Container();
    });
  }
}
