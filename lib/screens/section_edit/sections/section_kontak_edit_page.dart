import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/screens/section_edit/section_edit_page.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';
import 'package:provider/provider.dart';

class SectionKontakEditPage extends SectionEditPage {
  @override
  initState() {
    return super.initState();
  }

  @override
  Widget formView(BuildContext context) {
    FocusNode _nameFocusNode = FocusNode();
    FocusNode _descriptionFocusNode = FocusNode();
    FocusNode _contactNumberFocusNode = FocusNode();
    FocusNode _hubunganFocusNode = FocusNode();
    KontakSection? before;

    return Consumer<User>(builder: (_, user, __) {
      return Consumer<KontakSection>(builder: (_, kontak, __) {
        before = before ?? (kontak.copy() as KontakSection);

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
              text: kontak.name ?? "",
              focusNode: _nameFocusNode,
              onFieldSubmitted: (value) {
                _nameFocusNode.unfocus();
                FocusScope.of(context).requestFocus(_contactNumberFocusNode);
              },
              onChanged: (value) {},
              validator: (value) => kontak.nameValidator(),
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Nomor Kontak',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            NormalFormField(
              hintText: "ex. 0812345678",
              text: kontak.contactNumber?.toString() ?? "",
              focusNode: _contactNumberFocusNode,
              onFieldSubmitted: (value) {
                _contactNumberFocusNode.unfocus();
                FocusScope.of(context).requestFocus(_hubunganFocusNode);
              },
              keyboardType: TextInputType.number,
              onChanged: (value) {},
              validator: (value) => kontak.nameValidator(),
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Hubungan',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            NormalFormField(
              hintText: "ex. Anak",
              text: kontak.hubungan ?? "",
              focusNode: _hubunganFocusNode,
              onFieldSubmitted: (value) {
                _hubunganFocusNode.unfocus();
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
              onChanged: (value) {},
              validator: (value) => kontak.nameValidator(),
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Deskripsi',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            NormalFormField(
              hintText: "ex. Deskripsi",
              text: kontak.name ?? "",
              focusNode: _descriptionFocusNode,
              onFieldSubmitted: (value) {
                _descriptionFocusNode.unfocus();
              },
              // onChanged: (value) {
              // },
              validator: (value) => kontak.nameValidator(),
            ),
            const SizedBox(height: 45),
            Center(
              child: SizedBox(
                height: 50,
                child: BaseRaisedButton(
                  ratio: 1 / 1.25,
                  onPressed: () {
                    if (before?.name == null) {
                      user.kontak!.add(kontak);
                    }
                    kontak.notifyListeners();
                    UserHelper().updateUser(user.id ?? "", user);
                    user.notifyListeners();
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
    });
  }
}
