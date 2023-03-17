import 'package:flutter/material.dart';
import 'package:flutter_phoenix/interfaces/i_has_name.dart';
import 'package:flutter_phoenix/configs/configs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDropdown<T extends IHasName> extends StatefulWidget {
  final bool isExpanded;
  final String hint;
  final T selected;
  final void Function(T?) onChanged;
  final List<T?> list;

  const CustomDropdown({
    this.isExpanded = true,
    required this.hint,
    required this.selected,
    required this.onChanged,
    required this.list,
  });

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T extends IHasName>
    extends State<CustomDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]!),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<T>(
                isExpanded: widget.isExpanded,
                hint: Text(widget.hint),
                icon: const Icon(FontAwesomeIcons.caretDown),
                style: TextStyle(
                  fontSize: 16,
                  color: Configs.primaryColor,
                  fontFamily: "Svenska",
                ),
                value: widget.selected,
                onChanged: widget.onChanged,
                items: widget.list
                    .map(
                      (value) => DropdownMenuItem<T>(
                        value: value,
                        child: Text(value!.name!),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
