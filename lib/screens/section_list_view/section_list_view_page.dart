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
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/section_list_content_edit/kontak_section_list_edit.dart';
import 'package:flutter_phoenix/widgets/section_list_content_edit/pelatihan_section_list_edit.dart';
import 'package:flutter_phoenix/widgets/section_list_content_edit/pendidikan_section_list_edit.dart';
import 'package:flutter_phoenix/widgets/section_list_content_edit/penugasan_section_list_edit.dart';
import 'package:flutter_phoenix/widgets/section_list_content_edit/publikasi_section_list_edit.dart';
import 'package:provider/provider.dart';

class SectionListViewPage extends StatefulWidget {
  SectionListViewPage(
      {required this.target,
      required this.type,
      required this.user,
      super.key});

  @override
  _SectionListViewPageState createState() => _SectionListViewPageState();

  User target;
  User user;
  Type type;
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
    int length;
    if (widget.type == KontakSection) {
      length = widget.target.kontak?.length ?? 0;
    } else if (widget.type == PendidikanSection) {
      length = widget.target.pendidikan?.length ?? 0;
    } else if (widget.type == PenugasanSection) {
      length = widget.target.penugasan?.length ?? 0;
    } else if (widget.type == PelatihanSection) {
      length = widget.target.pelatihan?.length ?? 0;
    } else {
      length = widget.target.publikasi?.length ?? 0;
    }
    return ChangeNotifierProvider.value(
        value: widget.target,
        builder: (context, _) {
          return Consumer<User>(builder: (_, user, __) {
            return SingleChildScrollView(
              child: ListView.builder(
                itemBuilder: (context, i) {
                  if (widget.type == KontakSection) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 20,
                        ),
                        child: KontakSectionListEdit(
                          kontak: (widget.target.kontak?[i]) as KontakSection,
                          target: user,
                        ),
                      ),
                    );
                  }
                  if (widget.type == PendidikanSection) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 20,
                        ),
                        child: PendidikanSectionListEdit(
                          pendidikan: (widget.target.pendidikan?[i])
                              as PendidikanSection,
                          target: user,
                        ),
                      ),
                    );
                  }
                  if (widget.type == PenugasanSection) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 20,
                        ),
                        child: PenugasanSectionListEdit(
                          penugasan:
                              (widget.target.penugasan?[i]) as PenugasanSection,
                          target: user,
                        ),
                      ),
                    );
                  }
                  if (widget.type == PelatihanSection) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 20,
                        ),
                        child: PelatihanSectionListEdit(
                            pelatihan: (widget.target.pelatihan?[i])
                                as PelatihanSection,
                            target: user),
                      ),
                    );
                  }
                  if (widget.type == PublikasiSection) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 20,
                        ),
                        child: PublikasiSectionListEdit(
                          publikasi:
                              (widget.target.publikasi?[i]) as PublikasiSection,
                          target: user,
                        ),
                      ),
                    );
                  }
                },
                itemCount: length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            );
          });
        });
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
