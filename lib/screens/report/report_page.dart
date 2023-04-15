import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/enums/report_state.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/functions/token_version.dart';
import 'package:flutter_phoenix/models/report/report.dart';
import 'package:flutter_phoenix/models/report/report_helper.dart';
import 'package:flutter_phoenix/widgets/builder/user_builder.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/gallery_widget.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';

import '../../widgets/base_raised_button.dart';

class ReportPage extends StatefulWidget {
  ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late final ReportHelper reportHelper;
  late final FocusNode _bodyFocusNode;
  late final FocusNode _titleFocusNode;
  late final TextEditingController _bodyController;
  late final TextEditingController _titleController;
  late final List<String> _imageList;
  @override
  void initState() {
    reportHelper = ReportHelper();
    _imageList = [];
    _titleFocusNode = FocusNode();
    _bodyFocusNode = FocusNode();
    _bodyController = TextEditingController();
    _titleController = TextEditingController();
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
                onChanged: (value) {
                  _bodyController.text = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ReportGalleryWidget(
                images: _imageList,
                user: user,
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  child: BaseRaisedButton(
                    ratio: 1 / 1.25,
                    onPressed: () async {
                      Report report = Report(
                          body: _bodyController.text,
                          imageList: _imageList,
                          reportDate: DateTime.now(),
                          reportState: ReportState.Reported,
                          title: _titleController.text,
                          userId: (user?.id ?? ""));
                      try {
                        await reportHelper.update(report.id ?? "", report);
                        _titleController.text = "";
                        _bodyController.text = "";
                        setState(() {
                          _imageList.clear();
                        });
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
              ),
            ],
          ),
        );
      }),
    );
  }
}
