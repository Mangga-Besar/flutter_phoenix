import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/screens/base_screen.dart';
import 'package:flutter_phoenix/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/screens/home/home_page.dart';
import 'package:flutter_phoenix/screens/sectionListView/section_list_view_page.dart';
import 'package:flutter_phoenix/widgets/home_drawer.dart';

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
    return const HomeDrawer(selected: PageName.SectionList);
  }

  // @override
  // AppBar? appBar(BuildContext context) {
  //   // TODO: implement appBar
  //   return AppBar(
  //     // backgroundColor: Colors.transparent,
  //     elevation: 0,
  //   );
  // }
}
