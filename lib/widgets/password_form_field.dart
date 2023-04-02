import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_phoenix/configs/configs.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final bool? readOnly;
  final bool? enabled;
  final String? hintText;
  final String? labelText;

  final String? text;

  PasswordFormField({
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.textStyle,
    this.readOnly,
    this.enabled,
    this.hintText = "ex: ******",
    this.labelText = "Password",
    this.text,
  }) {
    _textEditingController.text = text ?? "";
  }

  @override
  State<StatefulWidget> createState() => _PasswordFormField();
}

class _PasswordFormField extends State<PasswordFormField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          enabled: widget.enabled,
          readOnly: widget.readOnly ?? false,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          focusNode: widget.focusNode,
          validator: widget.validator,
          cursorWidth: 2.5,
          cursorRadius: const Radius.circular(10),
          cursorColor: Configs.primaryColor,
          style: widget.textStyle ?? const TextStyle(fontSize: 16),
          obscureText: _obscure,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: widget.labelText,
            hintText: widget.hintText,
            suffixIcon: GestureDetector(
              onTap: () => setState(() {
                _obscure = !_obscure;
              }),
              child: Icon(
                  _obscure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
