import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/user_type.dart';
import 'package:flutter_phoenix/functions/toast_helper.dart';
import 'package:flutter_phoenix/models/chat/chat.dart';
import 'package:flutter_phoenix/models/chat/chat_helper.dart';
import 'package:flutter_phoenix/models/event/event.dart';
import 'package:flutter_phoenix/models/tenant/tenant.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FocusedMenuItemBuilder {
  static final ChatHelper chatHelper = ChatHelper();
  static final UserHelper userHelper = UserHelper();
  static Iterable<FocusedMenuItem> build({
    required BuildContext context,
    required User user,
    required Chat chat,
    String? parentId,
    Event? event,
    Tenant? tenant,
  }) sync* {
    if (tenant!.isAdmin(user) ||
        user.type == UserType.Committee ||
        user.type == UserType.Super)
      yield FocusedMenuItem(
        title: const Text(
          "Laporkan",
          style: TextStyle(color: Colors.redAccent),
        ),
        trailingIcon: const Icon(
          FontAwesomeIcons.triangleExclamation,
          color: Colors.redAccent,
        ),
        onPressed: () => AwesomeDialog(
          context: context,
          btnOkColor: Configs.color12,
          btnOkOnPress: () => chatHelper.inappropriate(
            chat.id!,
            parentId: parentId,
            tenantId: event == null ? tenant.id : null,
            eventId: event?.id,
          ),
          btnOkText: "LAPORKAN",
          headerAnimationLoop: false,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Tandai Bermasalah',
          desc: 'Yakin kamu ingin laporkan konten ini?',
        )..show(),
      );

    if (user.type == UserType.Member)
      yield FocusedMenuItem(
        title: const Text(
          "Laporkan",
          style: TextStyle(color: Colors.redAccent),
        ),
        trailingIcon: const Icon(
          FontAwesomeIcons.triangleExclamation,
          color: Colors.redAccent,
        ),
        onPressed: () => AwesomeDialog(
          context: context,
          btnOkOnPress: () async {
            try {
              chatHelper.inappropriateLive(chat.id);
              ToastHelper.show("Pelaporan Sukses", context);
            } catch (err) {
              FirebaseCrashlytics.instance.recordError(err, StackTrace.current);
            }
          },
          btnCancelOnPress: () => {},
          btnOkText: "YA",
          btnCancelText: "BATAL",
          headerAnimationLoop: false,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Laporkan Komentar ini?',
          desc:
              'Jika Komentar ini tidak relevan, silakan laporkan komentar ini.',
        )..show(),
      );

    if (user.type == UserType.Super)
      yield FocusedMenuItem(
        title: const Text(
          "BLOKIR",
          style: TextStyle(color: Configs.color12),
        ),
        trailingIcon: const Icon(
          FontAwesomeIcons.handSpock,
          color: Configs.color12,
        ),
        onPressed: () => AwesomeDialog(
          context: context,
          btnOkColor: Configs.color12,
          btnOkOnPress: () async {
            var user1 = chat.user;
            userHelper.block(user1!.id!);
          },
          btnOkText: "BLOKIR",
          headerAnimationLoop: false,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Blokir User ini',
          desc: 'Yakin kamu ingin blokir user ini?',
        )..show(),
      );
  }
}
