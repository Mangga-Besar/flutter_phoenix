import 'dart:convert';

import 'package:flutter_phoenix/basics/helpers/base_http_helper.dart';
import 'package:flutter_phoenix/models/report/report.dart';
import 'package:flutter_phoenix/models/user/user.dart';

class ReportHelper extends BaseHTTPHelper {
  @override
  String get route => "complaint";

  Future<void> update(String id, Report report) async {
    var map = jsonEncode(report.toVariables());
    var result = await post(endpoint: "update", json: map);
    print(result);
  }

  Future<void> delete(String id) async {
    var map = {"id": id};
    var jsonMap = jsonEncode(map);

    var result = await getGenerics(endpoint: "delete/$id", json: jsonMap);
    return result;
  }

  Future<Report> getReport(String id) async {
    var map = {"id": id};
    var jsonMap = jsonEncode(map);
    var result = await post(endpoint: "load", json: jsonMap);
    return Report.fromMap(result) ?? Report.empty();
  }

  Future<List<Report?>> getReportList(int start, int length) async {
    var map = {
      "filter": {"int": start, "length": length}
    };
    var jsonMap = jsonEncode(map);
    var res = await postGenerics(endpoint: "list", json: jsonMap);
    try {
      var result = res.map((e) => jsonDecode(e)).toList();
      return Report.fromMapList(result);
    } catch (err) {
      return [];
    }
  }
}
