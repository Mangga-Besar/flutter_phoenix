import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/exceptions/http_exception.dart';

import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/loading_function.dart';
import 'package:flutter_phoenix/functions/toast_helper.dart';
import 'package:flutter_phoenix/functions/token_version.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/models/login/login_data.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';
import 'package:flutter_phoenix/widgets/password_normal_form_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late UserHelper userHelper;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late LoginData loginData;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userHelper = UserHelper();

    loginData = LoginData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.asset(
          //   "assets/logo_long_black.png",
          //   width: 275,
          // ),
          // const SizedBox(height: 20),
          const CustomText(
            "Login ke Akunmu.",
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),

          const SizedBox(height: 20),
          const CustomText('Email', fontSize: 15, fontWeight: FontWeight.bold),
          NormalFormField(
            hintText: "Masukkan E-Mail kamu",
            text: loginData.email,
            keyboardType: TextInputType.emailAddress,
            onChanged: (val) => loginData.email = val,
          ),
          const SizedBox(height: 20),
          const CustomText(
            'Password',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          PasswordNormalFormField(
            text: loginData.password,
            hintText: "Masukkan Password kamu",
            onChanged: (val) => loginData.password = val,
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Routes.push(context, PageName.ForgetPassword),
              child: const Text(
                "Lupa Password?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color: Configs.secondaryColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 45),
          Center(
            child: SizedBox(
              height: 50,
              child: BaseRaisedButton(
                ratio: 1 / 1.25,
                onPressed: () async {
                  await login(context);
                },
                color: Configs.secondaryColor,
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    try {
      LoadingFunction.showLoadingDialog(context);
      var result = await userHelper.login(loginData);
      LoadingFunction.closeLoadingDialog(context);

      await TokenVersion.setTokenAndUserId(result.token!, result.userId!);
      ToastHelper.show("Login Berhasil!", context);

      Routes.pushReplacement(
        context,
        PageName.Home,
      );
    } catch (err) {
      LoadingFunction.closeLoadingDialog(context);

      switch ((err as HttpException).message) {
        case "Invalid Login":
          ToastHelper.showException("Login tidak dikenal!", context);
          break;
        default:
          ToastHelper.showException(err.message, context);
          break;
      }
    }
  }
}
