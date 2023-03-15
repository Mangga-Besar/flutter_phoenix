import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ScreenDetector {
  static bool isWeb(BuildContext context, {int maxWidth = 720}) {
    return kIsWeb && MediaQuery.of(context).size.width > maxWidth;
  }
}
