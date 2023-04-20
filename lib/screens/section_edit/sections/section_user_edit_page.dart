import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/functions/upload/firebase_uploader_helper.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/screens/section_edit/section_edit_page.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/date_time_picker_form_field.dart';
import 'package:flutter_phoenix/widgets/image_add_single.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';
import 'package:provider/provider.dart';

class SectionUserEditPage extends SectionEditPage {
  @override
  Widget formView(BuildContext context) {
    FocusNode _nameFocusNode = FocusNode();
    FocusNode _nikFocusNode = FocusNode();
    FocusNode _emailFocusNode = FocusNode();
    FocusNode _handPhoneFocusNode = FocusNode();
    FocusNode _addressFocusNode = FocusNode();
    FocusNode _dobFocusNode = FocusNode();
    FocusNode _agamaFocusNode = FocusNode();
    UserHelper _userHelper = UserHelper();
    return Consumer<User>(builder: (_, target, __) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            'Profile Picture',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: ImageAddSingle(
              image: target.profilePicture,
              onChanged: (file) {
                final fileName = "IMAGE_${target.id ?? ''}";
                FirebaseUploaderHelper(
                  filePath: file,
                  name: fileName,
                  user: target,
                  onComplete: (val) async {
                    target.profilePicture = val;
                    target.notifyListeners();
                  },
                ).upload();
              },
              withCrop: true,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          const CustomText(
            'Nama Lengkap',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          NormalFormField(
            hintText: "ex. Budi Gunawan",
            text: target.name ?? "",
            focusNode: _nameFocusNode,
            onFieldSubmitted: (value) {
              _nameFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_nikFocusNode);
            },
            onChanged: (value) {
              target.name = value;
            },
          ),
          const SizedBox(height: 10),
          const CustomText(
            'Nomor Induk Kependudukan (NIK)',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          NormalFormField(
            hintText: "ex. 31730xxxxxx",
            text: target.nik ?? "",
            focusNode: _nikFocusNode,
            onFieldSubmitted: (value) {
              _nikFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_emailFocusNode);
            },
            onChanged: (value) {
              target.nik = value;
            },
            // validator: (value) => newUser!.nameValidator(),
          ),
          const SizedBox(height: 10),
          const CustomText(
            'E-Mail',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          NormalFormField(
            hintText: "ex. xxxx@kanisius.edu",
            text: target.email ?? "",
            focusNode: _emailFocusNode,
            onFieldSubmitted: (value) {
              _emailFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_handPhoneFocusNode);
            },
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              target.email = value;
            },
            // validator: (value) => newUser!.nameValidator(),
          ),
          const SizedBox(height: 10),
          const CustomText(
            'Handphone',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          NormalFormField(
            hintText: "ex. 081234567",
            text: target.handPhone ?? "",
            focusNode: _handPhoneFocusNode,
            onFieldSubmitted: (value) {
              _handPhoneFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_addressFocusNode);
            },
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              target.handPhone = value;
            },
            // validator: (value) => newUser!.nameValidator(),
          ),
          const SizedBox(height: 10),
          const CustomText(
            'Address',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          NormalFormField(
            hintText: "ex. Jln. Menteng Raya, No. 64",
            text: target.address ?? "",
            focusNode: _addressFocusNode,
            onFieldSubmitted: (value) {
              _addressFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_dobFocusNode);
            },
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              target.address = value;
            },
            // validator: (value) => newUser!.nameValidator(),
          ),
          const SizedBox(height: 10),
          const CustomText(
            'Tanggal Lahir',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          DateTimePickerFormField(
            focusNode: _dobFocusNode,
            initialDate: target.dob ?? DateTime.now(),
            onChanged: (val) {
              target.dob = val;
              target.notifyListeners();
            },
          ),
          const SizedBox(height: 10),
          const CustomText(
            'Agama',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          NormalFormField(
            hintText: "ex. Katholik",
            text: target.agama ?? "",
            focusNode: _agamaFocusNode,
            onFieldSubmitted: (value) {
              _agamaFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_agamaFocusNode);
            },
            onChanged: (value) {
              target.agama = value;
            },
            // validator: (value) => newUser!.nameValidator(),
          ),
          const SizedBox(height: 25),
          UserBuilder(builder: (user) {
            if (user?.id == target.id) {
              return Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Routes.push(context, PageName.ChangePassword),
                  child: const Text(
                    "Ganti Password?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: Configs.secondaryColor,
                      fontSize: 15,
                    ),
                  ),
                ),
              );
            }
            return Container();
          }),
          const SizedBox(height: 45),
          Center(
            child: SizedBox(
              height: 50,
              child: BaseRaisedButton(
                ratio: 1 / 1.25,
                onPressed: () {
                  _userHelper.updateUser(target.id ?? "", target);
                  Routes.pop(context);
                },
                color: Configs.secondaryColor,
                child: const Text(
                  "SIMPAN",
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
      );
    });
  }
}
