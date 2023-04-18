import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/exceptions/http_exception.dart';
import 'package:flutter_phoenix/functions/screen_detector.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/functions/loading_function.dart';
import 'package:flutter_phoenix/functions/toast_helper.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/screens/verification_key/verification_key_screen.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/usual_form_field.dart';
import 'package:provider/provider.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late UserHelper? _userHelper;
  late TextEditingController _emailController;
  @override
  void initState() {
    _userHelper = UserHelper();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: Configs.topLeftRightEdgeInsets,
          child: Column(
            children: <Widget>[
              Image.asset("assets/forget_password.jpg", width: 250),
              const CustomText(
                "Masukkan E-Mail yang digunakan untuk Registrasi, dan kami akan mengirimkan Kode Resetnya",
                fontSize: 14,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              UsualFormField(
                text: _emailController.text,
                suffixIcon: const Icon(Icons.email, size: 20),
                labelText: "Alamat E-Mail",
                hintText: "ex: abc@xyz.com",
                onChanged: (val) => _emailController.text = val,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(FocusNode()),
              ),
              const SizedBox(height: 45),
              Center(
                child: SizedBox(
                  height: 50,
                  child: BaseRaisedButton(
                    ratio: 1 / 1.25,
                    color: Configs.secondaryColor,
                    onPressed: () async {
                      await resetPassword(context);
                    },
                    child: const Text(
                      "RESET",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        )
      ],
    );
  }

  Future<Object?> resetPassword(BuildContext context) async {
    try {
      LoadingFunction.showLoadingDialog(context);
      var result = await _userHelper!.forgetPassword(_emailController.text);
      LoadingFunction.closeLoadingDialog(context);
      if (result) {
        return Navigator.of(context).pushReplacement(MaterialPageRoute(
            settings: RouteSettings(
              arguments: {
                "email": _emailController.text,
              },
            ),
            builder: (context) => VerificationKeyScreen()));
      }
    } catch (err) {
      LoadingFunction.closeLoadingDialog(context);
      switch ((err as HTTPException).message) {
        case "ERROR_INVALID_EMAIL":
          ToastHelper.showException("E-Mail tidak valid!", context);
          break;
        default:
          ToastHelper.showException("E-Mail tidak dikenal!", context);
          break;
      }
    }
  }
}
