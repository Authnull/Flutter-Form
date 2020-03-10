import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerFormField extends FormField<DateTime> {
  DatePickerFormField({
    @required BuildContext context,
    String labelText,
    Icon prefixIcon,
    InputBorder border,
    FormFieldSetter<DateTime> onSaved,
    FormFieldValidator<DateTime> validator,
    DateTime initialValue,
    DateTime firstDate,
    DateTime lastDate,
    bool autovalidate = false,
    bool allowClear = false,
    String Function(DateTime date) formatter,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: autovalidate,
          builder: (FormFieldState<DateTime> state) {
            final String Function(DateTime date) dateFormatter = formatter ==
                    null
                ? (DateTime date) =>
                    "${state.value.month}/${state.value.day}/${state.value.year}"
                : formatter;

            final bool showClear = allowClear && state.value != null;
            final String displayValue =
                state.value != null ? dateFormatter(state.value) : "";
            return InkWell(
              child: InputDecorator(
                isEmpty: state.value == null,
                decoration: InputDecoration(
                  labelText: labelText,
                  prefixIcon: prefixIcon,
                  border: border,
                  errorText: state.errorText,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(displayValue),
                    showClear
                        ? InkWell(
                            onTap: state.reset,
                            child: Icon(Icons.clear, size: 15),
                          )
                        : Container(),
                  ],
                ),
              ),
              onTap: () async {
                DateTime date = await showDatePicker(
                  context: context,
                  initialDate:
                      initialValue == null ? DateTime.now() : initialValue,
                  firstDate: firstDate == null
                      ? DateTime(DateTime.now().year - 1)
                      : firstDate,
                  lastDate: lastDate == null ? DateTime(2100) : lastDate,
                );
                if (date != null) {
                  state.didChange(date);
                }
              },
            );
          },
        );
}
