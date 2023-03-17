import 'package:flutter/material.dart';

class BaseFormField extends StatelessWidget {
  BaseFormField({
    Key? key,
    this.text,
    this.labelText,
    this.hintText,
    this.icon,
    this.border,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.keyboardType,
    this.validator,
  });
  TextInputType? keyboardType;
  String? labelText;
  String? hintText;
  String? text;
  IconData? icon;
  InputBorder? border;
  Icon? prefixIcon, suffixIcon;
  bool? obscureText;
  final String Function(String?)? validator;

  Function(String)? onChanged;
  Function(String)? onFieldSubmitted;
  FocusNode? focusNode;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller.text = text ?? "";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        child: TextFormField(
          validator: validator,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            icon: Icon(icon),
            border: border,
            contentPadding: const EdgeInsets.all(1),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText ?? false,
        ),
      ),
    );
  }
}
