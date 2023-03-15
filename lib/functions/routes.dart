import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/functions/loading_function.dart';
import 'package:flutter_phoenix/interfaces/i_route_configuration.dart';
import 'package:flutter_phoenix/screens/about/about_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/add_tenant/add_tenant_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/committee/committee_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/discussion/discussion_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/discussion_list/discussion_list_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/edit_discussion/edit_discussion_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/home/home_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/lounge_list/lounge_list_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/major/major_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/major_list/major_list_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/presentation/presentation_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/schedule_list/schedule_list_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/set_pay/set_pay_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/tarian/tarian_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/tenant/tenant_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/tenant_list/tenant_list_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/user/change_password/change_password_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/user/email_verification/email_verification_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/user/forget_password/forget_password_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/user/info_login/info_login_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/user/login/login_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/user/new_password/new_password_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/user/register/register_screen_route_configuration.dart';
import 'package:flutter_phoenix/screens/user/settings/settings_screen_route_configuration.dart';
import 'package:flutter_phoenix/widgets/builder/future_use.dart';

class Routes {
  static List<IRouteConfiguration> listRoute = [
    AboutScreenRouteConfiguration(),
    AddTenantScreenRouteConfiguration(),
    HomeScreenRouteConfiguration(),
    MajorScreenRouteConfiguration(),
    TarianScreenRouteConfiguration(),
    CommitteeScreenRouteConfiguration(),
    TenantScreenRouteConfiguration(),
    TenantListScreenRouteConfiguration(),
    MajorListScreenRouteConfiguration(),
    PresentationScreenRouteConfiguration(),
    ScheduleListScreenRouteConfiguration(),
    DiscussionListScreenRouteConfiguration(),
    DiscussionScreenRouteConfiguration(),
    EditDiscussionScreenRouteConfiguration(),
    LoungeListScreenRouteConfiguration(),
    InfoLoginScreenRouteConfiguration(),
    LoginScreenRouteConfiguration(),
    RegisterScreenRouteConfiguration(),
    SettingsScreenRouteConfiguration(),
    ForgetPasswordScreenRouteConfiguration(),
    EmailVerificationScreenRouteConfiguration(),
    ChangePasswordScreenRouteConfiguration(),
    SetPayScreenRouteConfiguration(),
    NewPasswordScreenRouteConfiguration(),
  ];

  static Future<T?> pushAndRemoveUntil<T>(
      BuildContext context, PageName pageName,
      {Map<String, dynamic>? arguments}) {
    var config = findConfiguration(pageName);

    return Navigator.of(context).pushAndRemoveUntil<T>(
      getScreenRoute(context, config!, arguments),
      (Route<dynamic> route) => false,
    );
  }

  static Future<T?> pushAndRemoveUntilFirst<T>(
      BuildContext context, PageName pageName,
      {Map<String, dynamic>? arguments}) {
    var config = findConfiguration(pageName);

    return Navigator.of(context).pushAndRemoveUntil<T>(
      getScreenRoute(context, config!, arguments),
      (Route<dynamic> route) => route.isFirst,
    );
  }

  static Future<T?> pushReplacement<T>(BuildContext context, PageName pageName,
      {Map<String, dynamic>? arguments}) {
    var config = findConfiguration(pageName);

    return Navigator.of(context).pushReplacement(
      getScreenRoute(context, config!, arguments),
    );
  }

  static Future<T?> push<T>(BuildContext context, PageName pageName,
      {Map<String, dynamic>? arguments}) {
    var config = findConfiguration(pageName);

    return Navigator.of(context).push(
      getScreenRoute(context, config!, arguments),
    );
  }

  static void popToTop(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  static void pop(BuildContext context, {dynamic object, int times = 1}) {
    for (var i = 0; i < times - 1; i++) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).pop(object);
  }

  static IRouteConfiguration? findConfiguration(PageName pageName) {
    try {
      return listRoute.firstWhere((x) => x.pageName == pageName);
    } catch (err) {
      return null;
    }
  }

  static Route<T> getScreenRoute<T>(
    BuildContext context,
    IRouteConfiguration config,
    Object? arguments,
  ) {
    return MaterialPageRoute(
      builder: (context) => FutureUse<Widget>(
        future: config.getScreen(context),
        widget: LoadingFunction.loadingSquareCircle(context),
        builder: (context, snapshot) {
          return snapshot.data!;
        },
      ),
      settings: RouteSettings(
        name: EnumParser.getString(config.pageName),
        arguments: arguments,
      ),
    );
  }
}
