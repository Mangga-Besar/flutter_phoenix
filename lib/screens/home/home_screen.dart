import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/screens/base_screen.dart';
import 'package:flutter_phoenix/basics/screens/base_screen_with_app_bar.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/screens/home/home_page.dart';
import 'package:flutter_phoenix/widgets/home_drawer.dart';

class HomeScreen extends BaseScreenWithAppBar {
  HomeScreen()
      : super(
          "Home",
          PageName.Home,
          scrollable: false,
          padding: EdgeInsets.zero,
        );

  @override
  Widget content(BuildContext context) {
    return HomePage();
  }

  @override
  Widget? drawer(BuildContext context) {
    return const HomeDrawer(selected: PageName.Home);
  }

  @override
  AppBar? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      // backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
