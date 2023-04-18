import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/flare_function.dart';
import 'package:flutter_phoenix/functions/loading_function.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/functions/token_version.dart';
import 'package:flutter_phoenix/models/login/login_result.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/functions/toast_helper.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationKeyPage extends StatefulWidget {
  final String email;

  VerificationKeyPage({
    this.email = "",
  });

  @override
  _VerificationKeyPageState createState() => _VerificationKeyPageState();
}

class _VerificationKeyPageState extends State<VerificationKeyPage> {
  late UserHelper _helper;
  late String pin;
  late String email;

  @override
  void initState() {
    _helper = UserHelper();
    pin = "";
    email = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: Configs.screenEdgeInsets,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/email_verification.png',
                        width: 325,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        "Email Verifikasi sudah terkirim!",
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 25.0),
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        animationType: AnimationType.scale,
                        pinTheme: PinTheme(
                          activeColor: Configs.primaryColor,
                          inactiveColor: Colors.grey,
                          selectedColor: Configs.secondaryColor,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          borderWidth: 3.0,
                          fieldHeight: 70,
                          fieldWidth: 50,
                        ),
                        textStyle: TextStyle(
                          fontFamily: 'Svenska',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.number,
                        animationDuration: Duration(milliseconds: 250),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        onChanged: (val) => pin = val,
                        onCompleted: (val) async {
                          var result = await verify(val);
                          if (result) {
                            return Routes.pushAndRemoveUntilFirst(
                                context, PageName.ChangePassword);
                          } else if (!result) {
                            return Routes.push(
                              context,
                              PageName.Login,
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 15.0),
                      const CustomText(
                        "Jangan lupa cek di folder spam juga ya",
                        textAlign: TextAlign.center,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Positioned(
            left: 5,
            top: 10,
            child: BackButton(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> verify(String code) async {
    try {
      LoadingFunction.showLoadingDialog(context);
      var result = await _helper.validateKey(widget.email, code);
      LoadingFunction.closeLoadingDialog(context);
      await TokenVersion.setTokenAndUserId(result.token!, result.userId!);
      // if (result is LoginResult) {
      await FlareFunction.showTrueDialog(context);
      return true;
      // } else {
      //   await FlareFunction.showFalseDialog(context);
      //   ToastHelper.showException("Kode Verifikasi salah!", context);
      //   return false;
      // }
    } catch (err) {
      LoadingFunction.closeLoadingDialog(context);
      ToastHelper.showException("Ada Error!", context);
      await FlareFunction.showFalseDialog(context);
      return false;
    }
  }
}
