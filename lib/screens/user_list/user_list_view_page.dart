import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/picture_factory.dart';

class UserListViewPage extends StatefulWidget {
  UserListViewPage({super.key});

  @override
  _UserListViewPageState createState() => _UserListViewPageState();
}

class _UserListViewPageState extends State<UserListViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserBuilder(builder: (user) {
      List<User> listUser = [user ?? User.empty()];
      return SingleChildScrollView(
        child: ListView.builder(
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () async {
                await Routes.push(context, PageName.User,
                    arguments: {"user": user});
                setState(() {});
              },
              child: Material(
                color: Colors.transparent,
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 15.0,
                        ),
                        child: PictureFactory.build(
                            fit: BoxFit.contain,
                            height: 100,
                            width: 100,
                            "https://www.treasury.gov.ph/wp-content/uploads/2022/01/male-placeholder-image.jpeg"),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              listUser[i].name ?? "",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 7.5,
                            ),
                            CustomText(
                              listUser[i].email ?? "",
                              fontSize: 15,
                            ),
                            SizedBox(
                              height: 7.5,
                            ),
                            CustomText(
                              listUser[i].nik ?? "",
                              fontSize: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: listUser.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        ),
      );
    });
  }
}
