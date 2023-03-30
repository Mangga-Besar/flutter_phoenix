import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/functions/token_version.dart';
import 'package:flutter_phoenix/screens/home/home_screen.dart';
import 'package:flutter_phoenix/widgets/animated_splash/animated_splash.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    runApp(const MyApp());
  }, (error, stack) => null);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    // final FirebaseMessaging messaging = FirebaseMessaging.instance;

    // messaging.requestPermission(
    //   alert: true,
    //   announcement: true,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );

    return MaterialApp(
      title: Configs.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Svenska",
        primaryColor: Configs.primaryColor,
        accentColor: Configs.secondaryColor,
        errorColor: Configs.dangerColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Builder(builder: (context) {
      //   return AnimatedSplash(
      //     imagePath: "assets/splash.png",
      //     imageSize: const Size(325, 447),
      //     duration: const Duration(milliseconds: 1500),
      //     onReadyToGoNextScreen: () => getHomeScreen(context),
      //     onAnimationCompleted: () {},
      //     doInBackground: TokenVersion.init(),
      //     curve: Curves.easeInOutCirc,
      //     style: AnimationStyle.FadeIn,
      //   );
      //   // return HomeScreen();
      // }),
      home: HomeScreen(),
      // navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
    );
  }

  static void getHomeScreen(BuildContext context) {
    Routes.pushReplacement(context, PageName.Home);
  }
}
