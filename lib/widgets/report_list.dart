import 'package:flutter/material.dart';
import 'package:flutter_phoenix/enums/page_name.dart';
import 'package:flutter_phoenix/enums/report_state.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';
import 'package:flutter_phoenix/functions/routes.dart';
import 'package:flutter_phoenix/models/report/report.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/picture_factory.dart';

class ReportList extends StatefulWidget {
  ReportList({super.key, required this.report});
  Report report;

  @override
  State<ReportList> createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Routes.push(context, PageName.EditReport,
            arguments: {"report": widget.report});
        setState(() {});
      },
      child: Material(
        color: Colors.transparent,
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 15.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  widget.report.title ?? "",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 7.5,
                ),
                CustomText(
                  widget.report.body ?? "",
                  fontSize: 15,
                ),
                const SizedBox(
                  height: 2.5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: widget.report.reportState == ReportState.Reported
                        ? Colors.red
                        : widget.report.reportState == ReportState.Reviewed
                            ? Colors.blue
                            : Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CustomText(
                      EnumParser.getString(widget.report.reportState),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  endIndent: 0,
                  thickness: 2,
                  height: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
