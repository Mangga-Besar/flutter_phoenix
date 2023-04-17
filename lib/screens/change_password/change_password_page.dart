import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/functions/loading_function.dart';
import 'package:flutter_phoenix/functions/toast_helper.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/widgets/base_form_field.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late UserHelper _helper;

  FocusNode? _oldPasswordFocusNode;
  FocusNode? _newPasswordFocusNode;
  FocusNode? _confirmPasswordFocusNode;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _helper = UserHelper();

    _oldPasswordFocusNode = FocusNode();
    _newPasswordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _oldPasswordFocusNode?.dispose();
    _newPasswordFocusNode?.dispose();
    _confirmPasswordFocusNode?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserBuilder(
      builder: (user) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 15),
            Image.asset("assets/password.jpg", width: 275),
            const SizedBox(height: 15),
            BaseFormField(
              icon: CommunityMaterialIcons.lock_plus,
              obscureText: false,
              labelText: "Password Baru",
              focusNode: _newPasswordFocusNode,
              onChanged: (val) => _newPasswordController.text = val,
              onFieldSubmitted: (_) => FocusScope.of(context)
                  .requestFocus(_confirmPasswordFocusNode),
            ),
            const SizedBox(height: 10),
            BaseFormField(
              icon: CommunityMaterialIcons.lock_check,
              obscureText: false,
              labelText: "Konfirmasi Password Baru",
              focusNode: _confirmPasswordFocusNode,
              onChanged: (val) => _confirmPasswordController.text = val,
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
                    if (_newPasswordController.text !=
                        _confirmPasswordController.text)
                      return ToastHelper.showException(
                        "Password tidak sama..",
                        context,
                      );
                    try {
                      LoadingFunction.showLoadingDialog(context);
                      await _helper.changePassword(_newPasswordController.text);
                      ToastHelper.show("Password sudah diganti!", context);
                      LoadingFunction.closeLoadingDialog(context);
                      Navigator.of(context).pop();
                    } catch (err) {
                      LoadingFunction.closeLoadingDialog(context);
                      ToastHelper.showException(
                        "Ganti Password Gagal!",
                        context,
                      );
                    }
                  },
                  child: const Text(
                    "GANTI",
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
        );
      },
    );
  }
}
