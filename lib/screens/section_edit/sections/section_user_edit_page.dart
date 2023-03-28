import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/screens/section_edit/section_edit_page.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/date_time_picker_form_field.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';

class SectionUserEditPage extends SectionEditPage {
  SectionUserEditPage({this.user}) {
    newUser = User();
  }

  User? user, newUser;

  @override
  Widget formView(BuildContext context) {
    FocusNode _nameFocusNode = FocusNode();
    return Column(
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
          text: user?.name ?? "",
          focusNode: _nameFocusNode,
          onFieldSubmitted: (value) {
            _nameFocusNode.unfocus();
            // FocusScope.of(context).requestFocus(_emailFocusNode);
          },
          // onChanged: (value) {
          //   _registerData.name = value;
          // },
          // validator: (value) => user!.nameValidator(),
        ),
        const CustomText(
          'Nomor Induk Kependudukan (NIK)',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        NormalFormField(
          hintText: "ex. 31730xxxxxx",
          text: user?.nik ?? "",
          focusNode: _nameFocusNode,
          onFieldSubmitted: (value) {
            _nameFocusNode.unfocus();
            // FocusScope.of(context).requestFocus(_emailFocusNode);
          },
          // onChanged: (value) {
          //   _registerData.name = value;
          // },
          // validator: (value) => user!.nameValidator(),
        ),
        const CustomText(
          'E-Mail',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        NormalFormField(
          hintText: "ex. xxxx@kanisius.edu",
          text: user?.email ?? "",
          focusNode: _nameFocusNode,
          onFieldSubmitted: (value) {
            _nameFocusNode.unfocus();
            // FocusScope.of(context).requestFocus(_emailFocusNode);
          },
          keyboardType: TextInputType.emailAddress,
          // onChanged: (value) {
          //   _registerData.name = value;
          // },
          // validator: (value) => user!.nameValidator(),
        ),
        const CustomText(
          'Handphone',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        NormalFormField(
          hintText: "ex. 081234567",
          text: user?.handPhone ?? "",
          focusNode: _nameFocusNode,
          onFieldSubmitted: (value) {
            _nameFocusNode.unfocus();
            // FocusScope.of(context).requestFocus(_emailFocusNode);
          },
          keyboardType: TextInputType.phone,
          // onChanged: (value) {
          //   _registerData.name = value;
          // },
          // validator: (value) => user!.nameValidator(),
        ),
        const CustomText(
          'Address',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        NormalFormField(
          hintText: "ex. Jln. Menteng Raya, No. 64",
          text: user?.address ?? "",
          focusNode: _nameFocusNode,
          onFieldSubmitted: (value) {
            _nameFocusNode.unfocus();
            // FocusScope.of(context).requestFocus(_emailFocusNode);
          },
          keyboardType: TextInputType.emailAddress,
          // onChanged: (value) {
          //   _registerData.name = value;
          // },
          // validator: (value) => user!.nameValidator(),
        ),
        const CustomText(
          'Tanggal Lahir',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        DateTimePickerFormField(
          initialDate: user?.dob ?? DateTime.now(),
          onChanged: (val) => user!.dob = val,
        ),
        const CustomText(
          'Agama',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        NormalFormField(
          hintText: "ex. Katholik",
          text: user?.agama ?? "",
          focusNode: _nameFocusNode,
          onFieldSubmitted: (value) {
            _nameFocusNode.unfocus();
            // FocusScope.of(context).requestFocus(_emailFocusNode);
          },
          // onChanged: (value) {
          //   _registerData.name = value;
          // },
          // validator: (value) => user!.nameValidator(),
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
  }
}
