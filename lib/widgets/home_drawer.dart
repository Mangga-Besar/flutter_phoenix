import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
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
        child: Column(
          children: [
            Expanded(
              child: SafeArea(
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
                    NormalListTile(
                      leading: const Icon(FontAwesomeIcons.calendarDays),
                      title: const Text(
                        "Jadwal Acara",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onTap: () =>
                          getNavigation(context, PageName.ScheduleList),
                      selected: selected == PageName.ScheduleList,
                    ),
                    NormalListTile(
                      leading: const Icon(FontAwesomeIcons.graduationCap),
                      title: const Text(
                        "Peserta",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onTap: () => getNavigation(context, PageName.TenantList),
                      selected: selected == PageName.TenantList,
                    ),
                    NormalListTile(
                      leading: const Icon(FontAwesomeIcons.buildingColumns),
                      title: const Text(
                        "Jurusan",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onTap: () => getNavigation(context, PageName.MajorList),
                      selected: selected == PageName.MajorList,
                    ),
                    NormalListTile(
                      leading: const Icon(FontAwesomeIcons.bookBookmark),
                      title: const Text(
                        "Ruang Konsultasi",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onTap: () => getNavigation(context, PageName.LoungeList),
                      selected: selected == PageName.LoungeList,
                    ),
                    Divider(
                      height: 20,
                      color: Colors.grey[300],
                    ),
                    NormalListTile(
                      leading: const Icon(FontAwesomeIcons.music),
                      title: const Text(
                        "Tari Dero",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onTap: () => getNavigation(context, PageName.Tarian),
                      selected: selected == PageName.Tarian,
                    ),
                    NormalListTile(
                      leading: const Icon(FontAwesomeIcons.users),
                      title: const Text(
                        "Daftar Panitia",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onTap: () => getNavigation(context, PageName.Committee),
                      selected: selected == PageName.Committee,
                    ),
                    Divider(height: 20, color: Colors.grey[400]),
                  ],
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Image.asset(
                  'assets/logo_square.png',
                  width: imageSize,
                ),
              ),
            ),
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
