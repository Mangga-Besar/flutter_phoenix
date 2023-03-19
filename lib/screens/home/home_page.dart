import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/exceptions/http_exception.dart';
import 'package:flutter_phoenix/functions/loading_function.dart';
import 'package:flutter_phoenix/functions/toast_helper.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserHelper _helper;

  late GlobalKey<FormState> _formKey;
  late FocusNode _nameFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _handPhoneFocusNode;
  late FocusNode _institutionFocusNode;
  late FocusNode _kelasFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    _helper = UserHelper();
    _formKey = GlobalKey<FormState>();
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _handPhoneFocusNode = FocusNode();
    _institutionFocusNode = FocusNode();
    _kelasFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _handPhoneFocusNode.dispose();
    _institutionFocusNode.dispose();
    _kelasFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            const CustomText(
              'Nama Lengkap',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            NormalFormField(
              hintText: "ex. Budi Gunawan",
              // text: _registerData.name,
              focusNode: _nameFocusNode,
              onFieldSubmitted: (value) {
                _nameFocusNode.unfocus();
                FocusScope.of(context).requestFocus(_emailFocusNode);
              },
              // onChanged: (value) {
              //   _registerData.name = value;
              // },
              // validator: (value) => _registerData.nameValidator(),
            ),
            const SizedBox(height: 45),
            Center(
              child: SizedBox(
                height: 50,
                child: BaseRaisedButton(
                  ratio: 1 / 1.25,
                  onPressed: () {
                    register(context);
                  },
                  color: Configs.secondaryColor,
                  child: const Text(
                    "Save",
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
      ),
    );
  }

  Future<void> register(BuildContext context) async {
    try {
      // LoadingFunction.showLoadingDialog(context);
      // await _helper.register(_registerData);
      // LoadingFunction.closeLoadingDialog(context);

      ToastHelper.show("Registrasi Berhasil!", context);
    } catch (err) {
      LoadingFunction.closeLoadingDialog(context);
      switch ((err as HTTPException).message) {
        case "Duplicate email":
          ToastHelper.showException("E-Mail sudah terdaftar!", context);
          break;
        default:
          ToastHelper.showException(err.message, context);
          break;
      }
    }
  }
}
