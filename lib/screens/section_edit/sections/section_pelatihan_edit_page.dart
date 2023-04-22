import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/screens/section_edit/section_edit_page.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/date_time_picker_form_field.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';
import 'package:provider/provider.dart';

class SectionPelatihanEditPage extends SectionEditPage {
  @override
  Widget formView(BuildContext context) {
    FocusNode _nameFocusNode = FocusNode();
    FocusNode _linkFocusNode = FocusNode();
    FocusNode _pemberiSertifikatFocusNode = FocusNode();
    FocusNode _topikFocusNode = FocusNode();
    FocusNode _descriptionFocusNode = FocusNode();
    FocusNode _startDateFocusNode = FocusNode();
    FocusNode _endDateFocusNode = FocusNode();
    PelatihanSection? before;

    return Consumer<User>(builder: (_, user, __) {
      return Consumer<PelatihanSection>(builder: (_, pelatihan, __) {
        before = before ?? (pelatihan.copy() as PelatihanSection);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              'Nama',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            NormalFormField(
              hintText: "ex. Pelatihan Mengajar",
              text: pelatihan.name ?? "",
              focusNode: _nameFocusNode,
              onFieldSubmitted: (value) {
                _nameFocusNode.unfocus();
                FocusScope.of(context).requestFocus(_topikFocusNode);
              },
              onChanged: (value) {
                pelatihan.name = value;
              },
              // validator: (value) => pelatihan!.nameValidator(),
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Topik',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            NormalFormField(
              hintText: "ex. Kemampuan Mengajar",
              text: pelatihan.topik ?? "",
              focusNode: _topikFocusNode,
              onFieldSubmitted: (value) {
                _topikFocusNode.unfocus();
                FocusScope.of(context)
                    .requestFocus(_pemberiSertifikatFocusNode);
              },
              onChanged: (value) {
                pelatihan.topik = value;
              },
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Pemberi Sertifikat',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            NormalFormField(
              hintText: "ex. Goethe",
              text: pelatihan.name ?? "",
              focusNode: _pemberiSertifikatFocusNode,
              onFieldSubmitted: (value) {
                _pemberiSertifikatFocusNode.unfocus();
                FocusScope.of(context).requestFocus(_startDateFocusNode);
              },
              onChanged: (value) {
                pelatihan.pemberiSertifikat = value;
              },
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Tanggal Mulai Pelatihan',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            DateTimePickerFormField(
              focusNode: _startDateFocusNode,
              initialDate: pelatihan.startDate ?? DateTime.now(),
              onChanged: (val) {
                pelatihan.startDate = val;
                pelatihan.notifyListeners();
              },
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Tanggal Berakhir Pelatihan',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            DateTimePickerFormField(
              focusNode: _endDateFocusNode,
              initialDate: pelatihan.endDate ?? DateTime.now(),
              onChanged: (val) {
                pelatihan.endDate = val;
                pelatihan.notifyListeners();
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
              maxLines: 3,
              text: pelatihan.description ?? "",
              focusNode: _descriptionFocusNode,
              onFieldSubmitted: (value) {
                _descriptionFocusNode.unfocus();
              },
              onChanged: (value) {
                pelatihan.description = value;
              },
            ),
            const SizedBox(height: 45),
            Center(
              child: SizedBox(
                height: 50,
                child: BaseRaisedButton(
                  ratio: 1 / 1.25,
                  onPressed: () {
                    if (before?.name == null) {
                      user.pelatihan!.add(pelatihan);
                    }
                    pelatihan.notifyListeners();
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
