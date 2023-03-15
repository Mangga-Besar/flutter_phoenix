import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FlareFunction {
  static Future<void> showTrueDialog(BuildContext context) async {
    _showFlareDialog(context, 'assets/flare/check.flr', "refresh_check");
    await _delay(context);
  }

  static Future<void> showFalseDialog(BuildContext context) async {
    _showFlareDialog(context, 'assets/flare/cross.flr', "Error");
    await _delay(context);
  }

  static Future _delay(BuildContext context, {int milliseconds = 2000}) async {
    await Future.delayed(Duration(milliseconds: milliseconds), () {
      Navigator.of(context).pop();
    });
  }

  static Future _showFlareDialog(
      BuildContext context, String flarePath, String animation) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return FlareActor(
          flarePath,
          animation: animation,
        );
      },
    );
  }
}
