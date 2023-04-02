import 'package:flutter/material.dart';
import 'package:flutter_phoenix/functions/token_version.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/widgets/builder/future_use.dart';

class UserBuilder extends StatefulWidget {
  final Function(User?)? builder;
  final Widget? widget;
  UserBuilder({this.builder, this.widget});

  @override
  _UserBuilderState createState() => _UserBuilderState();
}

class _UserBuilderState extends State<UserBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureUse<String>(
        future: TokenVersion.getUserId(),
        builder: (context, ss) {
          return FutureUse<User?>(
            future: UserHelper().getUser(ss.data ?? ""),
            widget: widget.widget ?? Container(),
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.done
                    ? widget.builder!(snapshot.data)
                    : Container(),
          );
        });
  }
}
