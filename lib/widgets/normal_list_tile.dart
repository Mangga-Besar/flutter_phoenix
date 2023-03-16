import 'package:flutter/material.dart';
import 'package:flutter_phoenix/configs/configs.dart';

class NormalListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final bool selected;
  final void Function()? onTap;

  NormalListTile({this.leading, this.title, this.onTap, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(30)),
        child: Container(
          color: selected ? Configs.secondaryColor : Colors.transparent,
          child: ListTile(
            minLeadingWidth: 35,
            selected: selected,
            selectedColor: Configs.statusBarColor,
            leading: leading,
            title: title,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
