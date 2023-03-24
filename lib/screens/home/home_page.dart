import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/exceptions/http_exception.dart';
import 'package:flutter_phoenix/enums/pendidikan_level.dart';
import 'package:flutter_phoenix/functions/loading_function.dart';
import 'package:flutter_phoenix/functions/toast_helper.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';
import 'package:flutter_phoenix/widgets/base_raised_button.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';
import 'package:flutter_phoenix/widgets/section_part.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FocusNode _nameFocusNode;

  @override
  void initState() {
    _nameFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CustomText(
                        "BUDI GUNAWAN",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        'Budi@gunawan.com',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        '31730502030405',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        '082132456',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        'Jakarta ,15 Jan 2000',
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        'Jln. Kijoko Bodo, No 17E, RT 01, RW 01, Kota Jakarta Timur',
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                      CustomText(
                        'Katholik',
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      onPressed: () {
                        print("EDIT PROFILE");
                      },
                      icon: const Icon(
                        Icons.edit,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SectionPart(
              title: "KONTAK DARURAT",
              content: [
                KontakSection(
                    contactNumber: 120320130213,
                    description: "ASDSADAWDSAD",
                    hubungan: "AAAAAAAAAA",
                    name: "JOKOBODO")
              ],
            ),
            SectionPart(
              title: "PENDIDIKAN",
              content: [
                PendidikanSection(
                    description: "AAAA",
                    jurusan: "S!SD",
                    level: PendidikanLevel.S1,
                    lokasi: "BANDUNG",
                    name: "LULUS S1",
                    tahun: DateTime.now()),
                PendidikanSection(
                    description: "AAAA",
                    jurusan: "S!SD",
                    level: PendidikanLevel.S2,
                    lokasi: "BANDUNG",
                    name: "LULUS S1",
                    tahun: DateTime.now()),
              ],
            ),
            SectionPart(
              title: "PELATIHAN",
              content: [
                PelatihanSection(
                  description: "AAAA",
                  name: "ASDASDASD",
                  topik: "MEMBACA BUKU",
                  startDate: DateTime.now().subtract(Duration(days: 1)),
                  endDate: DateTime.now(),
                  pemberiSertifikat: "DIBERI TOKOPED",
                )
              ],
            ),
            SectionPart(
              title: "PUBLIKASI",
              content: [
                PublikasiSection(
                    bidangIlmu: "Biologi",
                    description: "AAAAAAAAAAAA",
                    name: "PAPER ABABABA",
                    tanggal: DateTime.now(),
                    topik: "DADASDASD")
              ],
            ),
            SectionPart(
              title: "PENUGASAN",
              content: [
                PenugasanSection(
                  description: "AAAAAAAAAA",
                  name: "MENGARANG Cerita ANAK",
                  tipePekerjaan: "ASD",
                  startDate: DateTime.now().subtract(Duration(days: 1)),
                  endDate: DateTime.now(),
                ),
                PenugasanSection(
                  description: "AAAAAAAAAA",
                  tipePekerjaan: "ASD",
                  name: "MENGARANG Cerita ANAK",
                  startDate: DateTime.now().subtract(Duration(days: 1)),
                  endDate: DateTime.now(),
                ),
                PenugasanSection(
                  description: "AAAAAAAAAA",
                  tipePekerjaan: "ASD",
                  name: "MENGARANG Cerita ANAK",
                  startDate: DateTime.now().subtract(Duration(days: 1)),
                  endDate: DateTime.now(),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     const Expanded(
            //       flex: 1,
            //       child: CustomText(
            //         'Nomor HP',
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     SizedBox(width: 10),
            //     Expanded(
            //       flex: 4,
            //       child: NormalFormField(
            //         hintText: "ex. 08123456",
            //         // text: _registerData.name,
            //         focusNode: _nameFocusNode,
            //         onFieldSubmitted: (value) {
            //           _nameFocusNode.unfocus();
            //         },
            //         keyboardType: TextInputType.number,

            //         // onChanged: (value) {
            //         //   _registerData.name = value;
            //         // },
            //         // validator: (value) => _registerData.nameValidator(),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 15),
            // Center(
            //   child: SizedBox(
            //     height: 50,
            //     child: BaseRaisedButton(
            //       ratio: 1 / 1.25,
            //       onPressed: () {
            //         register(context);
            //       },
            //       color: Configs.secondaryColor,
            //       child: const Text(
            //         "Save",
            //         style: TextStyle(
            //           fontSize: 18,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 20),
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
