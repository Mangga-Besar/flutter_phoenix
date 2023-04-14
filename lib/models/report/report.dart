import 'package:flutter_phoenix/enums/report_state.dart';
import 'package:flutter_phoenix/functions/enum_parser.dart';

class Report {
  static Report? _empty;
  String? id;
  String? title;
  String? body;
  String? userId;
  DateTime? reportDate;
  ReportState? reportState;

  Report(
      {this.title,
      this.body,
      this.id,
      this.userId,
      this.reportDate,
      this.reportState});

  static Report empty() {
    return _empty ??= Report(body: "");
  }

  Report copy() {
    return Report(
        title: title,
        body: body,
        id: id,
        userId: userId,
        reportDate: reportDate,
        reportState: reportState);
  }

  static Report? fromMap(Map<String, dynamic>? data) {
    return data == null
        ? null
        : Report(
            title: data["title"],
            body: data["body"],
            id: data["id"],
            userId: data["userId"],
            reportDate: DateTime.tryParse(data["reportDate"]),
            reportState:
                EnumParser.getEnum(ReportState.values, data["reportState"]),
          );
  }

  static List<Report?> fromMapList(List<dynamic>? data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "title": title,
      "body": body,
      "id": id,
      "userId": userId,
      "reportDate": reportDate?.toIso8601String(),
      "reportState": EnumParser.getString(reportState),
    };
  }

  Future<void> update() async {
    // await instance.collection('users').doc(id).update(toVariables());
  }
}
