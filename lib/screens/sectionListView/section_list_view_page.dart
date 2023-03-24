import 'package:flutter/material.dart';
import 'package:flutter_phoenix/basics/exceptions/http_exception.dart';
import 'package:flutter_phoenix/functions/loading_function.dart';
import 'package:flutter_phoenix/functions/toast_helper.dart';
import 'package:flutter_phoenix/interfaces/i_section.dart';
import 'package:flutter_phoenix/models/sections/kontak_section.dart';
import 'package:flutter_phoenix/models/sections/pelatihan_section.dart';
import 'package:flutter_phoenix/models/sections/pendidikan_section.dart';
import 'package:flutter_phoenix/models/sections/penugasan_section.dart';
import 'package:flutter_phoenix/models/sections/publikasi_section.dart';

import '../../widgets/section_list_content/kontak_section_list.dart';
import '../../widgets/section_list_content/pelatihan_section_list.dart';
import '../../widgets/section_list_content/pendidikan_section_list.dart';
import '../../widgets/section_list_content/penugasan_section_list.dart';
import '../../widgets/section_list_content/publikasi_section_list.dart';

class SectionListViewPage extends StatefulWidget {
  SectionListViewPage({required this.content, super.key});

  @override
  _SectionListViewPageState createState() => _SectionListViewPageState();

  List<ISection> content;
}

class _SectionListViewPageState extends State<SectionListViewPage> {
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: SingleChildScrollView(
        child: ListView.builder(
          itemBuilder: (context, i) {
            if (widget.content[i].ofType() == "Kontak") {
              return KontakSectionList(
                  kontak: (widget.content[i]) as KontakSection);
            }
            if (widget.content[i].ofType() == "Pendidikan") {
              return PendidikanSectionList(
                  pendidikan: (widget.content[i]) as PendidikanSection);
            }
            if (widget.content[i].ofType() == "Penugasan") {
              return PenugasanSectionList(
                  penugasan: (widget.content[i]) as PenugasanSection);
            }
            if (widget.content[i].ofType() == "Pelatihan") {
              return PelatihanSectionList(
                  pelatihan: (widget.content[i]) as PelatihanSection);
            }
            if (widget.content[i].ofType() == "Publikasi") {
              return PublikasiSectionList(
                  publikasi: (widget.content[i]) as PublikasiSection);
            }
          },
          itemCount: widget.content.length > 2 ? 2 : widget.content.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
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
