import 'package:flutter/material.dart';

abstract class SectionList extends StatefulWidget {
  const SectionList({super.key});

  @override
  State<SectionList> createState() => _SectionListState();
  Widget? getContent(BuildContext context);
}

class _SectionListState extends State<SectionList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: widget.getContent(context),
    );
  }
}
