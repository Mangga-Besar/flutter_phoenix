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
import 'package:flutter_phoenix/widgets/section_list_content_edit/kontak_section_list_edit.dart';
import 'package:flutter_phoenix/widgets/section_list_content_edit/pelatihan_section_list_edit.dart';
import 'package:flutter_phoenix/widgets/section_list_content_edit/pendidikan_section_list_edit.dart';
import 'package:flutter_phoenix/widgets/section_list_content_edit/penugasan_section_list_edit.dart';
import 'package:flutter_phoenix/widgets/section_list_content_edit/publikasi_section_list_edit.dart';

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
    return SingleChildScrollView(
      child: ListView.builder(
        itemBuilder: (context, i) {
          if (widget.content[i].ofType() == "Kontak") {
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20,
                ),
                child: KontakSectionListEdit(
                    kontak: (widget.content[i]) as KontakSection),
              ),
            );
          }
          if (widget.content[i].ofType() == "Pendidikan") {
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20,
                ),
                child: PendidikanSectionListEdit(
                    pendidikan: (widget.content[i]) as PendidikanSection),
              ),
            );
          }
          if (widget.content[i].ofType() == "Penugasan") {
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20,
                ),
                child: PenugasanSectionListEdit(
                    penugasan: (widget.content[i]) as PenugasanSection),
              ),
            );
          }
          if (widget.content[i].ofType() == "Pelatihan") {
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20,
                ),
                child: PelatihanSectionListEdit(
                    pelatihan: (widget.content[i]) as PelatihanSection),
              ),
            );
          }
          if (widget.content[i].ofType() == "Publikasi") {
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20,
                ),
                child: PublikasiSectionListEdit(
                    publikasi: (widget.content[i]) as PublikasiSection),
              ),
            );
          }
        },
        itemCount: widget.content.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
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
