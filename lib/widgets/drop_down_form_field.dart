import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/generic_controller.dart';

class DropDownFormField<E> extends FormField<E> {
  final GenericController<E> controller;
  final List<DropdownMenuItem<E>> items;
  final TextStyle style;
  final String hint;
  final Widget icon;
  final FormFieldValidator<E> validator;

  ///
  DropDownFormField({
    this.controller,
    this.items,
    this.hint = 'Auswählen',
    this.icon = const Icon(Icons.arrow_drop_down),
    this.style,
    this.validator,
    bool autovalidate = true,
  }) : super(
          builder: (state) {
            return DropdownButton<E>(
              style: style,
              items: items,
              value: controller.value,
              hint: Text(
                hint,
                style: TextStyle(color: state.hasError ? Colors.red : null),
              ),
              underline: state.hasError
                  ? Container(
                      height: 2,
                      color: Colors.red,
                    )
                  : null,
              icon: icon,
              onChanged: (itemSelect) {
                controller.value = itemSelect;
                state.didChange(itemSelect);
              },
            );
          },
          validator: validator,
          autovalidate: autovalidate,
        );
}
