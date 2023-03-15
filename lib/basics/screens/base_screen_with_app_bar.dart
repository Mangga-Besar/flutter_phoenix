import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/functions/loading_function.dart';
import 'package:flutter_phoenix/widgets/builder/future_use.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

abstract class BaseScreenWithAppBar extends StatefulWidget {
  final bool scrollable;
  final PageName pageName;
  final Color? backgroundColor;
  final String titleString;
  final EdgeInsets padding;

  // void Function(VoidCallback fn) setState;

  const BaseScreenWithAppBar(
    this.titleString,
    this.pageName, {
    this.scrollable = true,
    this.backgroundColor,
    this.padding = Configs.screenEdgeInsets,
  });

  Future<bool> beforeScaffold(BuildContext context) {
    return Future.value(true);
  }

  AppBar? appBar(BuildContext context) {
    return AppBar();
  }

  Widget title(BuildContext context) {
    return Text(titleString);
  }

  List<Widget> appBarActions(BuildContext context) {
    return [];
  }

  Widget? floatingActionButton(BuildContext context) {
    return null;
  }

  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }

  Widget? bottomSheet(BuildContext context) {
    return null;
  }

  Widget? drawer(BuildContext context);
  Widget content(BuildContext context);

  @override
  _BaseScreenWithAppBarState createState() => _BaseScreenWithAppBarState();
}

class _BaseScreenWithAppBarState extends State<BaseScreenWithAppBar> {
  @override
  void initState() {
    final analytics = FirebaseAnalytics.instance;

    analytics.setCurrentScreen(
      screenName: EnumParser.getString(widget.pageName),
    );

    analytics.logScreenView(
      screenName: EnumParser.getString(widget.pageName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureUse(
      future: widget.beforeScaffold(context),
      widget: LoadingFunction.loadingSquareCircle(context),
      builder: (context, snapshot) {
        return KeyboardDismisser(
          child: Scaffold(
            backgroundColor: widget.backgroundColor ?? Colors.white,
            drawer: widget.drawer(context),
            appBar: widget.appBar(context),
            bottomSheet: widget.bottomSheet(context),
            floatingActionButton: widget.floatingActionButton(context),
            bottomNavigationBar: widget.bottomNavigationBar(context),
            body: Padding(
              padding: widget.padding,
              child: _content(context),
            ),
          ),
        );
      },
    );
  }

  Widget _content(BuildContext context) {
    return widget.scrollable
        ? SingleChildScrollView(child: widget.content(context))
        : widget.content(context);
  }
}
