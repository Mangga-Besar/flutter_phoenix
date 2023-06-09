import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/functions/toast_helper.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/screens/section_edit/section_edit_page.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/date_time_picker_form_field.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';
import 'package:provider/provider.dart';

class SectionPublikasiEditPage extends SectionEditPage {
  SectionPublikasiEditPage({this.publikasi});

  PublikasiSection? publikasi;

  @override
  Widget formView(BuildContext context) {
    FocusNode _nameFocusNode = FocusNode();
    FocusNode _tanggalFocusNode = FocusNode();
    FocusNode _topikFocusNode = FocusNode();
    FocusNode _bidangIlmuFocusNode = FocusNode();
    FocusNode _descriptionFocusNode = FocusNode();

    PublikasiSection? before;
    final _formKey = GlobalKey<FormState>();

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Consumer<User>(builder: (_, user, __) {
        return Consumer<PublikasiSection>(builder: (_, publikasi, __) {
          before = before ?? (publikasi.copy() as PublikasiSection);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              const CustomText(
                'Nama *',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              NormalFormField(
                hintText: "ex. Bachelor of Science",
                focusNode: _nameFocusNode,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Nama tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (value) {
                  _nameFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(_tanggalFocusNode);
                },
                onChanged: (value) {
                  publikasi.name = value;
                },
              ),
              const SizedBox(height: 10),
              const CustomText(
                'Tanggal Berakhir Pelatihan',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              DateTimePickerFormField(
                focusNode: _tanggalFocusNode,
                onChanged: (val) {
                  publikasi.tanggal = val;
                },
              ),
              const SizedBox(height: 10),
              const CustomText(
                'Bidang Ilmu',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              NormalFormField(
                hintText: "ex. Biologi",
                focusNode: _bidangIlmuFocusNode,
                onFieldSubmitted: (value) {
                  _bidangIlmuFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(_topikFocusNode);
                },
                onChanged: (value) {
                  publikasi.bidangIlmu = value;
                },
              ),
              const SizedBox(height: 10),
              const CustomText(
                'Topik',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              NormalFormField(
                hintText: "ex. MikroBiologi",
                focusNode: _topikFocusNode,
                onFieldSubmitted: (value) {
                  _topikFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(_topikFocusNode);
                },
                onChanged: (value) {
                  publikasi.topik = value;
                },
              ),
              const SizedBox(height: 10),
              const CustomText(
                'Deskripsi',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              NormalFormField(
                hintText: "ex. Deskripsi",
                maxLines: null,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onFieldSubmitted: (value) {
                  _descriptionFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onChanged: (value) {
                  publikasi.description = value;
                },
              ),
              const SizedBox(height: 45),
              Center(
                child: SizedBox(
                  height: 50,
                  child: BaseRaisedButton(
                    ratio: 1 / 1.25,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (before?.name == null) {
                          user.publikasi!.add(publikasi);
                        }
                        publikasi.notifyListeners();
                        UserHelper().updateUser(user.id ?? "", user);
                        user.notifyListeners();
                        Routes.pop(context);
                      } else {
                        ToastHelper.showException(
                            "Terdapat Kesalahn pada data..", context);
                      }
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
      }),
    );
  }
}
