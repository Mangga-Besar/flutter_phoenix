import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';

class LinkTextWidget extends StatelessWidget {
  String linkText;
  Widget target;
  LinkTextWidget({
    Key? key,
    required this.linkText,
    required this.target,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => target,
        ),
      ),
      child: Text(
        linkText,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
          color: Configs.linkColor,
          fontSize: 16,
        ),
      ),
    );
  }
}

class RegisterPageMobile {}
