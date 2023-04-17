import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/functions/token_version.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/widgets/normal_list_tile.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeDrawer extends StatelessWidget {
  final PageName? selected;

  const HomeDrawer({super.key, this.selected});

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width / 3;

    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Drawer(
        // backgroundColor: Colors.transparent,
        // shadowColor: Colors.transparent,
        child: Column(
          children: [
            Expanded(
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          NormalListTile(
                            leading: const Icon(FontAwesomeIcons.houseChimney),
                            title: const Text(
                              "Beranda",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            onTap: () => getNavigation(context, PageName.Home),
                            selected: selected == PageName.Home,
                          ),
                          Divider(height: 20, color: Colors.grey[400]),
                          NormalListTile(
                            leading: const Icon(FontAwesomeIcons.userGroup),
                            title: const Text(
                              "User",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            onTap: () =>
                                getNavigation(context, PageName.UserList),
                            selected: selected == PageName.UserList,
                          ),
                          Divider(height: 20, color: Colors.grey[400]),
                          NormalListTile(
                            leading: const Icon(
                                FontAwesomeIcons.triangleExclamation),
                            title: const Text(
                              "Report",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            onTap: () =>
                                getNavigation(context, PageName.Report),
                            selected: selected == PageName.Report,
                          ),
                          Divider(height: 20, color: Colors.grey[400]),
                          NormalListTile(
                            leading: const Icon(FontAwesomeIcons.exclamation),
                            title: const Text(
                              "Report List",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            onTap: () =>
                                getNavigation(context, PageName.ReportList),
                            selected: selected == PageName.ReportList,
                          ),

                          // Divider(height: 20, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: ListTile(
                        minLeadingWidth: 35,
                        leading: const Icon(FontAwesomeIcons.deleteLeft),
                        title: const Text(
                          "Logout",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        onTap: () async {
                          await TokenVersion.clearTokenAndUserId();
                          Routes.pushReplacement(context, PageName.Login);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Align(
            //   alignment: FractionalOffset.bottomCenter,
            //   child: Padding(
            //     padding: const EdgeInsets.only(bottom: 32.0),
            //     child: Image.asset(
            //       'assets/logo_square.png',
            //       width: imageSize,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void getNavigation(BuildContext context, PageName pageName) {
    selected == pageName
        ? Routes.pop(context)
        : Routes.pushReplacement(context, pageName);
  }
}
