import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';

class CustomCheckBoxWithRichText extends StatefulWidget {
  final void Function(bool) onChanged;
  final bool initialValue;
  final List<InlineSpan> listInlineSpan;

  CustomCheckBoxWithRichText(this.listInlineSpan,
      {required this.onChanged, this.initialValue = false});

  @override
  _CustomCheckBoxWithRichTextState createState() =>
      _CustomCheckBoxWithRichTextState();
}

class _CustomCheckBoxWithRichTextState
    extends State<CustomCheckBoxWithRichText> {
  late bool value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        value = !value;
        widget.onChanged(value);
      },
      child: Row(
        children: <Widget>[
          Checkbox(
            activeColor: Configs.primaryColor,
            value: value,
            onChanged: (_) {
              value = !value;
              widget.onChanged(value);
            },
          ),
          Expanded(child: _getRichText()),
        ],
      ),
    );
  }

  Widget _getRichText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontFamily: "Svenska",
          fontSize: 14,
        ),
        children: this.widget.listInlineSpan,
      ),
    );
  }
}
