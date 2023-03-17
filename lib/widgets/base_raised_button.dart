import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';

class BaseRaisedButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget? child;
  final bool? disabled;
  final Color? color;
  final double ratio;
  final BorderSide? border;

  BaseRaisedButton({
    required this.onPressed,
    this.child,
    this.disabled = false,
    this.color = Configs.primaryColor,
    required this.ratio,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * ratio),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: border ?? BorderSide.none,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(color!),
          elevation: MaterialStateProperty.all<double>(0),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
