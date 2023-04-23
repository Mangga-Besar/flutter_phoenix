import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/report_state.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/report/report.dart';
import 'package:flutter_phoenix/models/report/report_helper.dart';
import 'package:flutter_phoenix/screens/section_edit/sections/section_pendidikan_edit_page.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';
import 'package:flutter_phoenix/widgets/custom/custom_dropdown.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/gallery_widget.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';

import '../../widgets/base_raised_button.dart';

class EditReportPage extends StatefulWidget {
  EditReportPage({super.key, required this.report});
  Report? report;

  @override
  _EditReportPageState createState() => _EditReportPageState();
}

class _EditReportPageState extends State<EditReportPage> {
  late final ReportHelper reportHelper;
  late final FocusNode _bodyFocusNode;
  late final FocusNode _titleFocusNode;
  late final TextEditingController _bodyController;
  late final TextEditingController _titleController;
  late final List<String> _imageList;
  var list;

  late DropdownClass dropdownClass = list[0];
  @override
  void initState() {
    list = [
      DropdownClass(name: "Reported"),
      DropdownClass(name: "Reviewed"),
      DropdownClass(name: "Resolved"),
    ];
    dropdownClass = widget.report!.reportState == ReportState.Reported
        ? list[0]
        : widget.report!.reportState == ReportState.Reviewed
            ? list[1]
            : list[2];
    reportHelper = ReportHelper();
    _imageList = widget.report?.imageList ?? [];
    _titleFocusNode = FocusNode();
    _bodyFocusNode = FocusNode();
    _bodyController = TextEditingController(text: widget.report?.body ?? "");
    _titleController = TextEditingController(text: widget.report?.title ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: UserBuilder(builder: (user) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: CustomText(
                  "Lapor Masalah",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                'Title',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              NormalFormField(
                hintText: "ex. AC rusak",
                text: _titleController.text,
                focusNode: _titleFocusNode,
                onFieldSubmitted: (value) {
                  _titleFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(_bodyFocusNode);
                },
                enabled: (user!.id == widget.report!.userId ||
                    user.isCommitee ||
                    user.isSuper),
                onChanged: (value) {
                  _titleController.text = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                'Laporan',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              NormalFormField(
                hintText: "ex. AC tidak menghasilkan udara yang sejuk.",
                text: _bodyController.text,
                focusNode: _bodyFocusNode,
                onFieldSubmitted: (value) {
                  _bodyFocusNode.unfocus();
                  // FocusScope.of(context).requestFocus(_contactNumberFocusNode);
                },
                enabled: (user.id == widget.report!.userId ||
                    user.isCommitee ||
                    user.isSuper),
                onChanged: (value) {
                  _bodyController.text = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ReportGalleryWidget(
                images: _imageList,
                enabled: (user.id == widget.report!.userId ||
                    user.isCommitee ||
                    user.isSuper),
                user: user,
              ),
              const SizedBox(
                height: 15,
              ),
              (user.isCommitee || user.isSuper)
                  ? CustomDropdown<DropdownClass>(
                      hint: "Kondisi Laporan",
                      selected: dropdownClass,
                      list: list,
                      onChanged: (val) {
                        setState(() {
                          dropdownClass = val ?? list[0];
                        });
                      },
                    )
                  : Container(),
              (user.id == widget.report!.userId ||
                      user.isCommitee ||
                      user.isSuper)
                  ? Center(
                      child: SizedBox(
                        height: 50,
                        child: BaseRaisedButton(
                          ratio: 1 / 1.25,
                          onPressed: () async {
                            Report report = Report(
                                body: _bodyController.text,
                                id: widget.report?.id,
                                imageList: _imageList,
                                reportDate:
                                    widget.report?.reportDate ?? DateTime.now(),
                                reportState: EnumParser.getEnum(
                                    ReportState.values, dropdownClass.name!),
                                title: _titleController.text,
                                userId: (user.id ?? ""));
                            try {
                              await reportHelper.update(
                                  report.id ?? "", report);
                              Routes.pop(context);
                            } catch (e) {
                              print(e);
                            }
                            // Routes.pop(context);
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
                    )
                  : Container(),
            ],
          ),
        );
      }),
    );
  }
}
