import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';

class CustomCheckBox extends StatefulWidget {
  final void Function(bool) onChanged;
  final bool initialValue;
  final String text;
  final bool disabled;
  final bool withExpanded;

  CustomCheckBox(
    this.text, {
    required this.onChanged,
    this.initialValue = false,
    this.disabled = false,
    this.withExpanded = true,
  });

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
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
        if (!widget.disabled) {
          setState(() {
            value = !value;
          });
          widget.onChanged(value);
        }
      },
      child: Row(
        children: <Widget>[
          Checkbox(
            activeColor: Configs.primaryColor,
            value: value,
            onChanged: (_) {
              if (!widget.disabled) {
                setState(() {
                  value = !value;
                });
                widget.onChanged(value);
              }
            },
          ),
          widget.withExpanded ? Expanded(child: _getText()) : _getText(),
        ],
      ),
    );
  }

  Widget _getText() {
    return Text(widget.text, style: const TextStyle(fontSize: 16));
  }
}
