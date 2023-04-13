import 'package:flutter/material.dart';
import 'package:flutter_phoenix/models/user/user.dart';
import 'package:flutter_phoenix/models/user/user_helper.dart';
import 'package:flutter_phoenix/widgets/custom/custom_text.dart';
import 'package:flutter_phoenix/widgets/user_list.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ReportPage extends StatefulWidget {
  ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late final UserHelper userHelper;

  @override
  void initState() {
    userHelper = UserHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomText(
          "Lapor Masalah",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
