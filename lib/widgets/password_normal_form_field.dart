import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_phoenix/configs/configs.dart';

class PasswordNormalFormField extends StatefulWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool? readOnly;
  final bool? enabled;
  final String? hintText;
  final double? withDivider;

  final String? text;

  PasswordNormalFormField({
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.onTap,
    this.textStyle,
    this.readOnly,
    this.enabled,
    this.hintText = "ex: ******",
    this.text,
    this.withDivider = 1,
  }) {
    _textEditingController.text = text ?? "";
  }

  @override
  State<StatefulWidget> createState() => _PasswordNormalFormField();
}

class _PasswordNormalFormField extends State<PasswordNormalFormField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / widget.withDivider!,
      child: TextFormField(
        enabled: widget.enabled ?? true,
        readOnly: widget.readOnly ?? false,
        textInputAction: widget.textInputAction,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        onTap: widget.onTap,
        focusNode: widget.focusNode,
        validator: widget.validator,
        cursorWidth: 2.5,
        cursorRadius: const Radius.circular(10),
        cursorColor: Configs.primaryColor,
        style: widget.textStyle ?? const TextStyle(fontSize: 16),
        obscureText: _obscure,
        decoration: InputDecoration(
          hintText: widget.hintText ?? "",
          suffixIcon: GestureDetector(
            onTap: () => setState(() {
              _obscure = !_obscure;
            }),
            child: Icon(
                _obscure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye),
          ),
        ),
      ),
    );
  }
}
