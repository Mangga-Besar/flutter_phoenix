import 'package:flutter/material.dart';

abstract class SectionEditPage extends StatefulWidget {
  @override
  initState() {
    initState();
  }

  Widget formView(BuildContext context);

  @override
  _SectionEditPageState createState() => _SectionEditPageState();
}

class _SectionEditPageState extends State<SectionEditPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: widget.formView(context),
      ),
    );
  }
}
