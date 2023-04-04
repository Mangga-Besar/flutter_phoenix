import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/screens/section_edit/section_edit_page.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/date_time_picker_form_field.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';
import 'package:provider/provider.dart';

class SectionPenugasanEditPage extends SectionEditPage {
  @override
  Widget formView(BuildContext context) {
    FocusNode _nameFocusNode = FocusNode();
    FocusNode _tipePekerjaanFocusNode = FocusNode();
    FocusNode _startDateFocusNode = FocusNode();
    FocusNode _endDateFocusNode = FocusNode();
    FocusNode _descriptionFocusNode = FocusNode();
    return Consumer<User>(builder: (_, user, __) {
      return Consumer<PenugasanSection>(builder: (_, penugasan, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            const CustomText(
              'Nama',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            NormalFormField(
              text: penugasan.name,
              hintText: "ex. Mengajar",
              focusNode: _nameFocusNode,
              onFieldSubmitted: (value) {
                _nameFocusNode.unfocus();
                FocusScope.of(context).requestFocus(_tipePekerjaanFocusNode);
              },
              onChanged: (value) {
                penugasan.name = value;
              },
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Tipe Pekerjaan',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            NormalFormField(
              text: penugasan.tipePekerjaan,
              hintText: "ex. Pengajar",
              focusNode: _tipePekerjaanFocusNode,
              onFieldSubmitted: (value) {
                _tipePekerjaanFocusNode.unfocus();
                FocusScope.of(context).requestFocus(_startDateFocusNode);
              },
              onChanged: (value) {
                penugasan.tipePekerjaan = value;
              },
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Tanggal Mulai Penugasan',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            DateTimePickerFormField(
              focusNode: _startDateFocusNode,
              initialDate: penugasan.startDate ?? DateTime.now(),
              onChanged: (val) {
                penugasan.startDate = val;
                penugasan.notifyListeners();
              },
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Tanggal Berakhir Penugasan',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            DateTimePickerFormField(
              focusNode: _endDateFocusNode,
              initialDate: penugasan.endDate ?? DateTime.now(),
              onChanged: (val) {
                penugasan.endDate = val;
                penugasan.notifyListeners();
              },
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Deskripsi',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            NormalFormField(
              text: penugasan.description,
              hintText: "ex. Deskripsi",
              focusNode: _descriptionFocusNode,
              onFieldSubmitted: (value) {
                _descriptionFocusNode.unfocus();
              },
              onChanged: (value) {
                penugasan.description = value;
              },
            ),
            const SizedBox(height: 45),
            Center(
              child: SizedBox(
                height: 50,
                child: BaseRaisedButton(
                  ratio: 1 / 1.25,
                  onPressed: () {
                    user.penugasan!.add(penugasan);
                    UserHelper().updateUser(user.id ?? "", user);
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
