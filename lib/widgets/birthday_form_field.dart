import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../util/generic_controller.dart';

class BirthdayFormField extends FormField<DateTime> {
  final GenericController<DateTime> controller;
  final FormFieldValidator<DateTime> validator;
  final String hint;
  final TextStyle style;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final TransitionBuilder dialogBuilder;
  final Color buttonColor;
  final Color hintColor;

  ///
  BirthdayFormField({
    this.controller,
    this.validator,
    this.hint,
    this.style,
    this.dialogBuilder,
    this.buttonColor,
    this.hintColor,
    bool autovalidate = true,
    @required this.initialDate,
    @required this.firstDate,
    @required this.lastDate,
  }) : super(
          builder: (state) {
            return FlatButton(
              color: buttonColor,
              child: Text(
                controller.value != null
                    ? DateFormat('dd.MM.yyyy').format(controller.value)
                    : hint,
                style:
                    state.hasError ? style?.copyWith(color: hintColor) : style,
              ),
              onPressed: () async {
                final birthday = await showDatePicker(
                  context: state.context,
                  initialDate: initialDate,
                  firstDate: firstDate,
                  lastDate: lastDate,
                  builder: dialogBuilder,
                );
                if (birthday != null) {
                  controller.value = birthday;
                  state.didChange(birthday);
                }
              },
            );
          },
          validator: validator,
          autovalidate: autovalidate,
        );
}
