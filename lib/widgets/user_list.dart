import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/picture_factory.dart';

class UserList extends StatefulWidget {
  UserList({super.key, required this.user});
  User user;

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Routes.push(context, PageName.User,
            arguments: {"user": widget.user});
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
                  widget.user.profilePicture ?? "",
                  fit: BoxFit.fitHeight,
                  height: 100,
                  width: 100,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      widget.user.name ?? "",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    CustomText(
                      widget.user.email ?? "",
                      fontSize: 15,
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    CustomText(
                      EnumParser.getString(widget.user.roleType),
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
  }
}
