import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/functions/date_parser.dart';

import '../configs/configs.dart';

class DateTimePickerFormField extends StatefulWidget {
  final DateTime? initialDate;
  final TextEditingController _textEditingController = TextEditingController();
  final void Function(String)? onFieldSubmitted;
  final void Function(DateTime) onChanged;
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLines;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool? readOnly;
  final bool? enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final double? withDivider;
  final bool? isRemoveable;

  final DateTime? firstDate;
  final DateTime? lastDate;

  DateTimePickerFormField({
    required this.onChanged,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.hintText,
    this.onFieldSubmitted,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.textCapitalization,
    this.textInputAction,
    this.validator,
    this.isRemoveable = true,
    this.focusNode,
    this.readOnly,
    this.enabled,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.decoration,
    this.controller,
    this.withDivider = 1,
  }) {
    _textEditingController.text =
        DateParser.parseDateOnly(initialDate ?? DateTime.now());
  }

  @override
  _DateTimePickerFormFieldState createState() =>
      _DateTimePickerFormFieldState();
}

class _DateTimePickerFormFieldState extends State<DateTimePickerFormField> {
  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  @override
  void initState() {
    dateTime = widget.initialDate;
    if (dateTime != null) timeOfDay = TimeOfDay.fromDateTime(dateTime!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: [
            GestureDetector(
              onTap: () async {
                var date = await showDatePicker(
                  // initialDatePickerMode: DatePickerMode.year,
                  context: context,
                  initialDate: dateTime ?? DateTime.now(),
                  firstDate: widget.firstDate ?? DateTime(1950),
                  lastDate: widget.lastDate ?? DateTime(2099),
                );
                if (date != null) {
                  dateTime = DateTime(
                    date.year,
                    date.month,
                    date.day,
                  );
                  setState(() {});
                  widget.onChanged(dateTime!);
                }
              },
              child: Container(
                height: 60,
                color: Colors.transparent,
                child: IgnorePointer(
                  child: TextFormField(
                    // enabled: false,
                    readOnly: true,
                    textInputAction: widget.textInputAction,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    textCapitalization:
                        widget.textCapitalization ?? TextCapitalization.none,
                    focusNode: widget.focusNode,
                    validator: widget.validator,
                    controller:
                        widget.controller ?? widget._textEditingController,
                    cursorWidth: 2.5,
                    cursorRadius: const Radius.circular(10),
                    cursorColor: Configs.primaryColor,
                    style: const TextStyle(fontSize: 16),
                    keyboardType: widget.keyboardType ?? TextInputType.text,
                    decoration: widget.decoration ??
                        InputDecoration(
                          hintText: widget.hintText ?? "",
                          prefixIcon: widget.prefixIcon,
                          suffixIcon: widget.suffixIcon,
                        ),
                    maxLines: widget.maxLines ?? 1,
                    maxLength: widget.maxLength,
                    inputFormatters: widget.inputFormatters ?? const [],
                  ),
                ),
              ),
            ),
            if (dateTime != null && widget.isRemoveable!)
              Positioned(
                right: 0,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      dateTime = null;
                    });
                    widget.onChanged(null!);
                  },
                  child: Container(
                    height: 60,
                    width: 40,
                    child: Center(
                      child: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
