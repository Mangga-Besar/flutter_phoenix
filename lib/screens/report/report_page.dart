import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/report/report.dart';
import 'package:flutter_phoenix/models/report/report_helper.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/normal_form_field.dart';

import '../../widgets/base_raised_button.dart';

class ReportPage extends StatefulWidget {
  ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late final ReportHelper reportHelper;
  late final FocusNode _reportFocusNode;
  late final TextEditingController _reportController;
  @override
  void initState() {
    reportHelper = ReportHelper();
    _reportFocusNode = FocusNode();
    _reportController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            "Lapor Masalah",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          Row(
            children: [
              Icon(Icons.report),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: NormalFormField(
                  hintText: "ex. AC rusak",
                  text: _reportController.text,
                  focusNode: _reportFocusNode,
                  onFieldSubmitted: (value) {
                    _reportFocusNode.unfocus();
                    // FocusScope.of(context).requestFocus(_contactNumberFocusNode);
                  },
                  onChanged: (value) {
                    _reportController.text = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: BaseRaisedButton(
              ratio: 1 / 1.25,
              onPressed: () {
                Report report = Report(body: _reportController.text);
                reportHelper.update(report.id ?? "", report);
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
        ],
      ),
    );
  }
}
