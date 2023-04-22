import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/pendidikan_level.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/interfaces/i_has_name.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/screens/section_edit/section_edit_page.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/date_time_picker_form_field.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom/custom_dropdown.dart';

class SectionPendidikanEditPage extends SectionEditPage {
  @override
  Widget formView(BuildContext context) {
    FocusNode _nameFocusNode = FocusNode();
    FocusNode _jurusanFocusNode = FocusNode();
    FocusNode _lokasiFocusNode = FocusNode();
    FocusNode _tahunFocusNode = FocusNode();
    FocusNode _descriptionFocusNode = FocusNode();
    var list = [
      DropdownClass(name: "SD"),
      DropdownClass(name: "SMP"),
      DropdownClass(name: "SMA"),
      DropdownClass(name: "SMK"),
      DropdownClass(name: "D3"),
      DropdownClass(name: "S1"),
      DropdownClass(name: "S2"),
      DropdownClass(name: "S3"),
    ];
    PendidikanSection? before;
    return Consumer<User>(builder: (_, user, __) {
      return Consumer<PendidikanSection>(builder: (_, pendidikan, __) {
        late DropdownClass dropdownClass = list.firstWhere(
          (element) {
            return pendidikan.level ==
                EnumParser.getEnum(PendidikanLevel.values, element.name!);
          },
        );
        before = before ?? (pendidikan.copy() as PendidikanSection);

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
              hintText: "ex. Bachelor of Science",
              text: pendidikan.name ?? "",
              focusNode: _nameFocusNode,
              onFieldSubmitted: (value) {
                _nameFocusNode.unfocus();
                FocusScope.of(context).requestFocus(_tahunFocusNode);
              },
              onChanged: (value) {
                pendidikan.name = value;
              },
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Tahun',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            DateTimePickerFormField(
              focusNode: _tahunFocusNode,
              initialDate: pendidikan.tahun ?? DateTime.now(),
              onChanged: (val) {
                pendidikan.tahun = val;
                pendidikan.notifyListeners();
              },
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Lokasi / Institusi',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            NormalFormField(
              hintText: "ex. Universitas Indonesia",
              text: pendidikan.lokasi ?? "",
              focusNode: _lokasiFocusNode,
              onFieldSubmitted: (value) {
                _lokasiFocusNode.unfocus();
                FocusScope.of(context).requestFocus(_jurusanFocusNode);
              },
              onChanged: (value) {
                pendidikan.lokasi = value;
              },
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Tingkat',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            CustomDropdown<DropdownClass>(
              hint: "Pilih Tingkat Pendidikan",
              selected: dropdownClass,
              list: list,
              onChanged: (val) {
                dropdownClass = val ?? list[0];
              },
            ),
            const SizedBox(height: 10),
            const CustomText(
              'Jurusan*',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            NormalFormField(
              hintText: "ex. IPA / IPS",
              text: pendidikan.tahun?.year.toString() ?? "",
              focusNode: _jurusanFocusNode,
              onFieldSubmitted: (value) {
                _jurusanFocusNode.unfocus();
              },
              onChanged: (value) {
                pendidikan.jurusan = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const CustomText(
                  'Link Terkait*',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(
                  onPressed: () {
                    pendidikan.link ??= <String>[];
                    pendidikan.link!.add("");
                    pendidikan.notifyListeners();
                  },
                  icon: Icon(Icons.add),
                )
              ],
            ),
            ListView.builder(
              itemCount: pendidikan.link?.length ?? 0,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: NormalFormField(
                          hintText: "Link #$i",
                          text: pendidikan.link![i],
                          onChanged: (value) {
                            pendidikan.link![i] = value;
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          pendidikan.link!.removeAt(i);
                          pendidikan.notifyListeners();
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                );
              },
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
            const SizedBox(height: 45),
            Center(
              child: SizedBox(
                height: 50,
                child: BaseRaisedButton(
                  ratio: 1 / 1.25,
                  onPressed: () {
                    pendidikan.level = EnumParser.getEnum(
                        PendidikanLevel.values, dropdownClass.name ?? "");
                    if (before?.name == null) {
                      user.pendidikan!.add(pendidikan);
                    }
                    pendidikan.notifyListeners();
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

class DropdownClass implements IHasName {
  @override
  String? name;
  DropdownClass({this.name});
}
