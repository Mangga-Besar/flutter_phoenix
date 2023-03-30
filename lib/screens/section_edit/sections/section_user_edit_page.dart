import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/screens/section_edit/section_edit_page.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/date_time_picker_form_field.dart';
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
    return Consumer<User>(builder: (_, user, __) {
      User newUser = user.copy();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            'Nama Lengkap',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          NormalFormField(
            hintText: "ex. Budi Gunawan",
            text: newUser.name ?? "",
            focusNode: _nameFocusNode,
            onFieldSubmitted: (value) {
              _nameFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_nikFocusNode);
            },
            onChanged: (value) {
              newUser.name = value;
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
            text: newUser.nik ?? "",
            focusNode: _nikFocusNode,
            onFieldSubmitted: (value) {
              _nikFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_emailFocusNode);
            },
            onChanged: (value) {
              newUser.nik = value;
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
            text: newUser.email ?? "",
            focusNode: _emailFocusNode,
            onFieldSubmitted: (value) {
              _emailFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_handPhoneFocusNode);
            },
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              newUser.email = value;
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
            text: newUser.handPhone ?? "",
            focusNode: _handPhoneFocusNode,
            onFieldSubmitted: (value) {
              _handPhoneFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_addressFocusNode);
            },
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              newUser.handPhone = value;
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
            text: newUser.address ?? "",
            focusNode: _addressFocusNode,
            onFieldSubmitted: (value) {
              _addressFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_dobFocusNode);
            },
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              newUser.address = value;
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
            initialDate: newUser.dob ?? DateTime.now(),
            onChanged: (val) {
              newUser.dob = val;
              newUser.notifyListeners();
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
            text: newUser.agama ?? "",
            focusNode: _agamaFocusNode,
            onFieldSubmitted: (value) {
              _agamaFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_agamaFocusNode);
            },
            onChanged: (value) {
              newUser.agama = value;
            },
            // validator: (value) => newUser!.nameValidator(),
          ),
          const SizedBox(height: 45),
          Center(
            child: SizedBox(
              height: 50,
              child: BaseRaisedButton(
                ratio: 1 / 1.25,
                onPressed: () {},
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
